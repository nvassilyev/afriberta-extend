import glob
import os
import json

directory = '../models/ner/'
file_patterns = []

for item in os.listdir(directory):
    item_path = os.path.join(directory, item)  
    
    if os.path.isdir(item_path):  
        folder_name = item  
        file_pattern = directory + folder_name + "/test_result*.txt"
        file_patterns.append(file_pattern)


for file_pattern in sorted(file_patterns):
    # Initialize variables
    total_f1 = 0
    total_loss = 0
    total_precision = 0
    total_recall = 0
    count = 0

    # Iterate over the files
    for file_name in glob.glob(file_pattern):
        with open(file_name, 'r') as file:
            # Read the lines from the file
            lines = file.readlines()

            # Extract the values from the lines
            f1 = float(lines[0].split('=')[1].strip())
            # loss = float(lines[1].split('=')[1].strip())
            # precision = float(lines[2].split('=')[1].strip())
            # recall = float(lines[3].split('=')[1].strip())

            # Accumulate the values
            total_f1 += f1
            # total_loss += loss
            # total_precision += precision
            # total_recall += recall
            count += 1

    # Calculate the averages
    average_f1 = total_f1 / count
    # average_loss = total_loss / count
    # average_precision = total_precision / count
    # average_recall = total_recall / count

    # Print the results
    model = file_pattern.split('/')[-2]
    print(f"NER: {model}, f1:", round(average_f1, 4))
    # print("Average loss:", average_loss)
    # print("Average precision:", average_precision)
    # print("Average recall:", average_recall)

print()
directory = '../models/mlm/'
file_patterns = []

for item in os.listdir(directory):
    item_path = os.path.join(directory, item)  
    
    if os.path.isdir(item_path):  
        folder_name = item  
        file_pattern = directory + folder_name + "/all_results.json"
        file_patterns.append(file_pattern)

for file in sorted(file_patterns):
    with open(file, 'r') as f:
        data = json.load(f)

    model = file.split('/')[-2]
    print(f"MLM: {model}, eval_accuracy:", round(data['eval_accuracy'], 4))

