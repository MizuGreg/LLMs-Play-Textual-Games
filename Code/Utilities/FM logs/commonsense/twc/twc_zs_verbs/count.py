import pandas as pd

def count_is_effective_values(csv_file_path):
    # Read the CSV file into a DataFrame
    df = pd.read_csv(csv_file_path)
    
    # Ensure the 'is_effective' column exists
    if 'is_effective' not in df.columns:
        raise ValueError("The input CSV file does not contain the 'is_effective' column.")
    
    # Count the occurrences of 0, 1, and 2 in the 'is_effective' column
    counts = df['is_effective'].value_counts()
    
    # Get the counts for each value, defaulting to 0 if the value is not present
    count_0 = counts.get(0, 0)
    count_1 = counts.get(1, 0)
    count_2 = counts.get(2, 0)
    
    # Print the counts
    print(f"Count of 0: {count_0}")
    print(f"Count of 1: {count_1}")
    print(f"Count of 2: {count_2}")
    '''for idx, row in df.iterrows():
        if row['is_effective']==0:
            print('0',row['text'])
    for idx, row in df.iterrows():
        if row['is_effective']==1:
            print('1',row['text'])'''

count_is_effective_values('/home/forasassimaberino/Trainer/data/preprocessed/commonsense/twc/twc_zs_verbs/action_wise_dialogues.csv')