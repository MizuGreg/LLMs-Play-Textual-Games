import pandas as pd

def process_csvs(csv1_path, csv2_path, csv3_path, csv4_path):
    # Read the first three CSV files
    df3 = pd.read_csv(csv3_path)
    df4 = pd.read_csv(csv4_path)

    # Add a column 'is_positive' with every value set to 1 to the first three DataFrames
    df3['is_positive'] = 1


    # Concatenate df3 to df4
    df_merged = pd.concat([df4, df3], ignore_index=True)

    # Save the merged DataFrame to the path of the fourth CSV file
    merged_csv_path = csv4_path.replace('.csv', '_merged.csv')
    df_merged.to_csv(merged_csv_path, index=False)

# Example usage:
csv1_path = '/home/forasassimaberino/Trainer/data/preprocessed/cooking_contrastive/cooking_contrastive_test.csv'
csv2_path = '/home/forasassimaberino/Trainer/data/preprocessed/cooking_contrastive/cooking_contrastive_validation.csv'
csv3_path = '/home/forasassimaberino/Trainer/data/preprocessed/twc_contrastive/twc_zs_verbs_train.csv'
csv4_path = '/home/forasassimaberino/Trainer/data/preprocessed/twc_contrastive/twc_contrastive_train.csv'
process_csvs(csv1_path, csv2_path, csv3_path, csv4_path)
