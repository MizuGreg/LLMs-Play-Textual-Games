import pandas as pd

def add_is_positive_column(csv1_path, csv2_path, output_csv1_path, output_csv2_path):
    # Read the CSV files into DataFrames
    df1 = pd.read_csv(csv1_path)
    df2 = pd.read_csv(csv2_path)
    
    # Add the 'is_positive' column with value 1 to each DataFrame
    df1['is_positive'] = 1
    df2['is_positive'] = 1
    
    # Write the modified DataFrames back to new CSV files
    df1.to_csv(output_csv1_path, index=False)
    df2.to_csv(output_csv2_path, index=False)
    
    print(f"Modified CSV files have been saved as '{output_csv1_path}' and '{output_csv2_path}'.")

# Example usage:
# add_is_positive_column('input1.csv', 'input2.csv', 'output1.csv', 'output2.csv')


csv1_path = '/home/forasassimaberino/Trainer/data/preprocessed/commonsense/twc/twc_zs_verbs/twc_zs_verbs_action_wise_train.csv'
csv2_path = '/home/forasassimaberino/Trainer/data/preprocessed/commonsense/twc/twc_zs_verbs/twc_zs_verbs_action_wise_validation.csv'

add_is_positive_column(csv1_path, csv2_path, csv1_path, csv2_path)