import logging
from logging.handlers import RotatingFileHandler
import os

def setup_logger(name, log_file, level=logging.INFO, clear_log=False):
    formatter = logging.Formatter('%(asctime)s %(levelname)s %(message)s')

    # Ensure the log directory exists
    os.makedirs(os.path.dirname(log_file), exist_ok=True)

    # Clear the log file if requested
    if clear_log and os.path.exists(log_file):
        open(log_file, 'w').close()

    handler = RotatingFileHandler(log_file, maxBytes=10000000, backupCount=5)
    handler.setFormatter(formatter)

    logger = logging.getLogger(name)
    logger.setLevel(level)
    
    # Remove any existing handlers to avoid duplication
    if logger.hasHandlers():
        logger.handlers.clear()
    
    logger.addHandler(handler)

    # Add a StreamHandler to output logs to console as well
    console_handler = logging.StreamHandler()
    console_handler.setFormatter(formatter)
    logger.addHandler(console_handler)

    return logger

# Create loggers
bom_logger = setup_logger('bom_logger', 'logs/bom.log', clear_log=True)
inventory_logger = setup_logger('inventory_logger', 'logs/inventory.log', clear_log=True)

def clear_log(logger):
    """Function to clear the log file associated with the given logger."""
    for handler in logger.handlers:
        if isinstance(handler, RotatingFileHandler):
            handler.doRollover()
            break

# Usage example:
# from .utils.logger import bom_logger, inventory_logger, clear_log
# 
# def some_function():
#     clear_log(bom_logger)  # Clear the log at the start of the function
#     bom_logger.info("Starting process...")
#     # ... rest of the function
#
# def another_function():
#     clear_log(inventory_logger)  # Clear the log at the start of the function
#     inventory_logger.info("Starting inventory process...")
#     # ... rest of the function
