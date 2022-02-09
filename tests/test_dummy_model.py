from ..pollos_petrel import read_trainig_dataset


# Lee train.csv
def test_read_training_dataset():
    read_trainig_dataset()


# Calcula promedio de target
# Lee test.csv
# Tira todas las columnas excepto id
# Agrega columna target con el promedio
# Guarda el archivo con sufijo _submission.csv
