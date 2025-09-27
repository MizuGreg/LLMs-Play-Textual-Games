import pandas as pd

def process_csv_files(csv1, csv2, csv3, csv4):
    # Read CSV files into DataFrames
    df1 = pd.read_csv(csv1)
    df2 = pd.read_csv(csv2)
    df3 = pd.read_csv(csv3)
    df4 = pd.read_csv(csv4)
    
    # Remove rows with 'game' column set as 'cooking' from first two CSVs
    df1 = df1[df1['game'] != 'cooking']
    df2 = df2[df2['game'] != 'cooking']
    
    # Add new column 'is_positive' with value 1 to first two CSVs
    df1['is_positive'] = 1
    df2['is_positive'] = 1
    
    # Concatenate first CSV with third and second CSV with fourth
    merged_df1 = pd.concat([df1, df3], ignore_index=True)
    merged_df2 = pd.concat([df2, df4], ignore_index=True)

    

    merged_df1.to_csv(f'{csv1}')
    merged_df2.to_csv(f'{csv2}')
    return merged_df1, merged_df2

csv1 = '/home/forasassimaberino/Trainer/data/preprocessed/leave_one_out/twc_all_games/twc_all_games_train.csv'
csv2 = '/home/forasassimaberino/Trainer/data/preprocessed/leave_one_out/twc_all_games/twc_all_games_validation.csv'
csv3 = '/home/forasassimaberino/Trainer/data/preprocessed/ck_reprise/cooking_reprise_1it_contrastive/cooking_reprise_1it_contrastive_positive_train.csv'
csv4 = '/home/forasassimaberino/Trainer/data/preprocessed/ck_reprise/cooking_reprise_1it_contrastive/cooking_reprise_1it_contrastive_positive_validation.csv'

merged_df1, merged_df2 = process_csv_files(csv1, csv2, csv3, csv4)

