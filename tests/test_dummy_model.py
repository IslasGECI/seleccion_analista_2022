from pollos_petrel import (
    add_mean_as_target,
    drop_all_but_id,
    get_mean_target,
    read_testing_dataset,
    read_training_dataset,
)
import pandas as pd


# Lee train.csv
def test_read_training_dataset():
    training_dataset = read_training_dataset()
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
def test_read_testing_dataset():
    testing_dataset = read_testing_dataset()
    obtained_n_rows = testing_dataset.shape[0]
    expected_n_rows = 326
    assert expected_n_rows == obtained_n_rows


# Tira todas las columnas excepto id
def test_drop_all_but_id():
    data = {"id": [1, 2], "target": [3, 4]}
    dataset = pd.DataFrame(data=data)
    dataset_only_id = drop_all_but_id(dataset)
    obtained_columns = list(dataset_only_id.columns)
    expected_columns = ["id"]
    assert expected_columns == obtained_columns


# Agrega columna target con el promedio
def test_add_mean_as_target():
    add_mean_as_target()


# Guarda el archivo con sufijo _submission.csv
