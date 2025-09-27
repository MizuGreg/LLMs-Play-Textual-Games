import pandas as pd

def keep_specific_columns(csv_file):
    # Read the CSV file into a DataFrame
    df = pd.read_csv(csv_file)
    
    # Specify the columns to keep
    columns_to_keep = ['dialogue_id', 'game', 'text', 'speaker', 'utterance_idx']
    
    # Drop columns that are not in the specified list
    df = df[columns_to_keep]
    
    return df

# Example usage:
csv_file = '/home/forasassimaberino/Trainer/data/preprocessed/commonsense_3424/commonsense_3424_validation.csv'  # Change this to the path of your CSV file
result_df = keep_specific_columns(csv_file)
result_df.to_csv(csv_file)