import numpy as np
from PIL import Image
from scipy.fftpack import dct, idct
import matplotlib.pyplot as plt
from skimage.metrics import peak_signal_noise_ratio as psnr

# Matriz de cuantización
Q = np.array([[16, 11, 10, 16, 24, 40, 51, 61],
              [12, 12, 14, 19, 26, 58, 60, 55],
              [14, 13, 16, 24, 40, 57, 69, 56],
              [14, 17, 22, 29, 51, 87, 80, 62],
              [18, 22, 37, 56, 68, 109, 103, 77],
              [24, 35, 55, 64, 81, 104, 113, 92],
              [49, 64, 78, 87, 103, 121, 120, 101],
              [72, 92, 95, 98, 112, 100, 103, 99]])*10;


import cv2

def load_image(path):
    img = cv2.imread(path, cv2.IMREAD_GRAYSCALE)
    return img



def block_split(img, block_size):
    h, w = img.shape
    blocks = []
    for i in range(0, h, block_size):
        for j in range(0, w, block_size):
            block = img[i:i + block_size, j:j + block_size]
            if block.shape[0] != block_size or block.shape[1] != block_size:
                # Rellenar con ceros si el bloque es más pequeño que el tamaño del bloque
                padded_block = np.zeros((block_size, block_size))
                padded_block[:block.shape[0], :block.shape[1]] = block
                blocks.append(padded_block)
            else:
                blocks.append(block)
    return blocks


def apply_dct(blocks):
    dct_blocks = []
    for block in blocks:
        dct_block = dct(dct(block.T, norm='ortho').T, norm='ortho')
        dct_blocks.append(dct_block)
    return dct_blocks


def quantize(blocks, q_matrix):
    quantized_blocks = []
    for block in blocks:
        quantized_block = np.round(block / q_matrix)
        quantized_blocks.append(quantized_block)
    return quantized_blocks


def zigzag_flatten(blocks):
    block_size = blocks[0].shape[0]
    zigzag_order = [(i // block_size, i % block_size) for i in range(block_size ** 2)]
    zigzag_order.sort(key=lambda x: x[0] + x[1])

    sequences = []
    for block in blocks:
        sequence = [block[i, j] for i, j in zigzag_order]
        sequences.append(sequence)
    return sequences


def zigzag_decode(sequences, block_size):
    zigzag_order = [(i // block_size, i % block_size) for i in range(block_size ** 2)]
    zigzag_order.sort(key=lambda x: x[0] + x[1])
    blocks = []
    for sequence in sequences:
        block = np.zeros((block_size, block_size))
        for i, coef in enumerate(sequence):
            block[zigzag_order[i]] = coef
        blocks.append(block)
    return blocks


def dequantize(blocks, q_matrix):
    dequantized_blocks = []
    for block in blocks:
        dequantized_block = block * q_matrix
        dequantized_blocks.append(dequantized_block)
    return dequantized_blocks


def apply_idct(blocks):
    idct_blocks = []
    for block in blocks:
        idct_block = idct(idct(block.T, norm='ortho').T, norm='ortho')
        idct_blocks.append(idct_block)
    return idct_blocks


def reconstruct_image(blocks, img_shape, block_size):
    h, w = img_shape
    img = np.zeros(img_shape)
    i = 0
    for y in range(0, h, block_size):
        for x in range(0, w, block_size):
            block_h = min(block_size, h - y)  # Asegurarse de que el bloque no se sale de la imagen
            block_w = min(block_size, w - x)  # Asegurarse de que el bloque no se sale de la imagen
            img[y:y + block_h, x:x + block_w] = blocks[i][:block_h, :block_w]
            i += 1
    return img


img_array = load_image('peppers.png')
# Divide la imagen en bloques
blocks = block_split(img_array, 8)
dct_blocks = apply_dct(blocks)
quantized_blocks = quantize(dct_blocks, Q)

# Codifica los bloques en secuencias zig-zag
sequences = zigzag_flatten(quantized_blocks)

# Decodifica las secuencias en bloques y deshace la cuantización
decoded_blocks = zigzag_decode(sequences, 8)
dequantized_blocks = dequantize(decoded_blocks, Q)

# Aplica la IDCT a cada bloque y reconstruye la imagen
idct_blocks = apply_idct(dequantized_blocks)
reconstructed_img = np.clip(reconstruct_image(idct_blocks, img_array.shape, 8), 0, 255)


peak_signal_noise_ratio = round(psnr(img_array, reconstructed_img), 2)
print(f"PSNR: {peak_signal_noise_ratio}")

# Muestra la imagen original y la reconstruida
plt.figure(figsize=(10, 5))
plt.subplot(1, 2, 1)
plt.imshow(img_array, cmap='gray')
plt.title('Imagen Original')
plt.axis('off')

plt.subplot(1, 2, 2)
plt.imshow(reconstructed_img, cmap='gray')
plt.title('Imagen Reconstruida')
plt.axis('off')

plt.tight_layout()
plt.show()
