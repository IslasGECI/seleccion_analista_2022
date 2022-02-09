import pandas as pd


# Lee train.csv
def read_trainig_dataset():
    training_dataset_path = "pollos_petrel/train.csv"
    training_dataset = pd.read_csv(training_dataset_path)
    return training_dataset


# Calcula promedio de target
# Lee test.csv
# Tira todas las columnas excepto id
# Agrega columna target con el promedio
# Guarda el archivo con sufijo _submission.csv
