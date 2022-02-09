from pollos_petrel import get_mean_target, read_trainig_dataset
import pandas as pd


# Lee train.csv
def test_read_training_dataset():
    training_dataset = read_trainig_dataset()
    obtained_n_rows = training_dataset.shape[0]
    expected_n_rows = 1304
    assert expected_n_rows == obtained_n_rows


# Calcula promedio de target
def test_get_mean_target():
    data = {"id": [1, 2], "target": [3, 4]}
    dataset = pd.DataFrame(data=data)
    obtained_mean = get_mean_target(dataset)
    expected_mean = 3.5
    assert expected_mean == obtained_mean


# Lee test.csv
# Tira todas las columnas excepto id
# Agrega columna target con el promedio
# Guarda el archivo con sufijo _submission.csv
