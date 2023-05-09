import cv2
import matplotlib.pyplot as plt
import numpy as np
from skimage.metrics import peak_signal_noise_ratio as psnr


def adpcm_encode(image, bits=8):
    num_levels = 2 ** bits - 1

    prediction_matrix = np.zeros_like(image)
    error_matrix = np.zeros_like(image)

    # El primer valor de la predicción será el primer valor de la imagen
    prediction_matrix[0, 0] = image[0, 0]
    error_matrix[0, 0] = image[0, 0] - prediction_matrix[0, 0]

    # Cuantizar el error inicial
    error_matrix[0, 0] = np.around(error_matrix[0, 0] * num_levels) / num_levels

    step_size = 1

    # Calcular la predicción para todas las filas
    prediction_matrix[:, 1:] = image[:, :-1]
    prediction_matrix[:, 0] = image[:, 0]

    # Calcular la matriz de error
    error_matrix = image - prediction_matrix

    # Cuantizar el error
    quantized_error = np.around(error_matrix * num_levels) / num_levels

    # Ajustar el paso de cuantización basándose en el error
    if np.max(np.abs(quantized_error)) > step_size:
        step_size *= 2
    else:
        step_size /= 2

    # Asegurarse de que el paso de cuantización no sea menor que 1
    step_size = max(1, step_size)

    # Aplicar el paso de cuantización al error
    error_matrix = quantized_error * step_size

    # Cuantizar la predicción
    prediction_matrix = np.around(prediction_matrix / (2 ** (8 - bits))) * (2 ** (8 - bits))

    return prediction_matrix, error_matrix


def adpcm_decode(prediction_image, error_image):
    recovered_matrix = np.add(prediction_image, error_image)
    return recovered_matrix


def adpcm_image_processing(image):
    prediction_image, error_image = adpcm_encode(image, bits=2)
    recovered_image = adpcm_decode(prediction_image, error_image)
    return prediction_image, error_image, recovered_image


def plot(image, prediction_image, error_image, recovered_image):
    plt.figure(figsize=(10, 10))

    plt.subplot(2, 2, 1)
    plt.imshow(image, cmap='gray')
    plt.title('Imagen original')

    plt.subplot(2, 2, 2)
    plt.imshow(prediction_image, cmap='gray')
    plt.title('Predicción')

    plt.subplot(2, 2, 3)
    plt.imshow(error_image, cmap='gray')
    plt.title('Error')

    plt.subplot(2, 2, 4)
    plt.imshow(recovered_image, cmap='gray')
    peak_signal_noise_ratio = round(psnr(image, recovered_image), 2)
    plt.title(f"Imagen recuperada (PSNR = {peak_signal_noise_ratio})")

    plt.show()


img = cv2.imread('peppers.png', cv2.IMREAD_GRAYSCALE)

if img is None:
    raise Exception("No se pudo leer la imagen")
prediction_image, error_image, recovered_red = adpcm_image_processing(img)
plot(img, prediction_image, error_image, recovered_red)
