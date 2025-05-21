import pandas as pd

def merge_and_remove_duplicates(csv1, csv2, csv3, csv4):
    # Read CSV files into pandas DataFrames
    df1 = pd.read_csv(csv1)
    df2 = pd.read_csv(csv2)
    df3 = pd.read_csv(csv3)
    df4 = pd.read_csv(csv4)

    df1 = df1.drop(columns=['tbr'])
    df2 = df2.drop(columns=['tbr'])
    df3 = df3.drop(columns=['tbr'])
    df4 = df4.drop(columns=['tbr'])
    # Concatenate first and third DataFrames, and second and fourth DataFrames
    merged_df1 = pd.concat([df1, df3], ignore_index=True)
    merged_df2 = pd.concat([df2, df4], ignore_index=True)
    
    # Remove duplicates from concatenated DataFrames
    merged_df1 = merged_df1.drop_duplicates()
    merged_df2 = merged_df2.drop_duplicates()

    merged_df1 = merged_df1[merged_df1['game'] != 'treasure_hunter']
    merged_df2 = merged_df2[merged_df2['game'] != 'treasure_hunter']
    
    merged_df1.to_csv(f'{csv1}_s')
    merged_df2.to_csv(f'{csv2}_s')

# Example usage
csv1 = "/home/forasassimaberino/Trainer/data/preprocessed/leave_one_out/th_all_games/th_all_games_train.csv"
csv2 = "/home/forasassimaberino/Trainer/data/preprocessed/leave_one_out/th_all_games/th_all_games_validation.csv"
csv3 = "/home/forasassimaberino/Trainer/data/preprocessed/leave_one_out/th_all_games/cc_all_games_train.csv"
csv4 = "/home/forasassimaberino/Trainer/data/preprocessed/leave_one_out/th_all_games/cc_all_games_validation.csv"

merge_and_remove_duplicates(csv1, csv2, csv3, csv4)

