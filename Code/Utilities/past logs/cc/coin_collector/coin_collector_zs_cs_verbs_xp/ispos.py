import pandas as pd

def add_is_positive_column(train_csv_path, validation_csv_path):
    # Load the train and validation CSV files into pandas DataFrames
    train_df = pd.read_csv(train_csv_path)
    validation_df = pd.read_csv(validation_csv_path)
    
    # Add a new column named 'is_positive' with all values set to 1
    train_df['is_positive'] = 1
    validation_df['is_positive'] = 1
    
    # Save the modified DataFrames back to CSV files
    train_df.to_csv(train_csv_path, index=False)
    validation_df.to_csv(validation_csv_path, index=False)

# Example usage:
train_csv_path = "Trainer/data/preprocessed/cc/coin_collector/coin_collector_zs_cs_verbs_xp/coin_collector_zs_cs_verbs_xp_positive_train.csv"
validation_csv_path = "Trainer/data/preprocessed/cc/coin_collector/coin_collector_zs_cs_verbs_xp/coin_collector_zs_cs_verbs_xp_positive_validation.csv"

add_is_positive_column(train_csv_path, validation_csv_path)
