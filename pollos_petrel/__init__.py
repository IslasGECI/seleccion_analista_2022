"""A dummy Python module"""

__version__ = "0.1.0"
from .do_nothing import return_one  # noqa
from .dummy_model import (
    add_mean_as_target,
    drop_all_but_id,
    get_mean_target,
    read_testing_dataset,
    read_training_dataset,
)  # noqa
