from matplotlib import pyplot as plt
import pandas as pd
import numpy as np
import os 
import sys
import argparse

plt.rcParams.update({
    "font.serif": ['Times New Roman'],
    "font.sans-serif": ['Arial'],
    "font.family": 'serif',
    "font.size": "4",
    # не использовать настройки шрифтов самого matplotlib
    "pgf.rcfonts": False,
    "pgf.texsystem": 'xelatex',
    "xtick.minor.visible": True,
    "ytick.minor.visible": True,
    "axes.grid": True,
    "axes.grid.which": 'both',
    "grid.linewidth": 0.25,
    "grid.linestyle": 'dashed',
    "grid.color": 'gray',
})

parser = argparse.ArgumentParser()
h = "Формат картинки"
parser.add_argument('-f', '--format', type=str, choices=('png', 'pdf', 'pgf'), help=h)
h = "Каталог для сохранения картинок"
parser.add_argument('-d', '--directory', type=str, default='img', help=h)

args = parser.parse_args()

# если задан формат картинки, то используем его
FMT = args.format if args.format else 'png'

FOLDER = args.directory + os.sep

# Before the import I've added by hand the row "mes" in the text. 
data = pd.read_csv("out.txt")
mes = data.to_numpy()
std = np.std(mes)
avg = np.average(mes)

# Гистограмма разниц по времени. 
fig = plt.figure(figsize=(6,2))
ax = fig.add_subplot(1,1,1)
ax.hist(mes, density=True, bins=400, range=(0, 0.04), label=f"Гистограмма разниц по времени \n\nCреднее: {avg} \
\nДисперсия: {std}")
ax.set_ylabel('Frequency')
ax.set_xlabel('Data')
ax.legend(loc="best")


print("сохраняем изображения")
# Если каталога нет, то создаем
if os.path.exists(FOLDER):
    print(f"{FOLDER} существует")
else:
    print(f"{FOLDER} не существует, создаем")
    os.makedirs(FOLDER)

params = dict(format=FMT, dpi=300, bbox_inches='tight', pad_inches=0.0)
fig.savefig(f"{FOLDER}diff.{FMT}", **params)