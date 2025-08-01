import os

files = [f.name.removesuffix(".py") for f in list(os.scandir('./Code/Utilities/PoliGame'))]
print(files)

