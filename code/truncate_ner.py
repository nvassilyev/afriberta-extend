languages = ['xho', 'yor', 'ara']

for lang in languages:
    filename = f"../data/ner/{lang}/train.txt"
    output_filename = f"../data/ner/{lang}/train_500.txt"

    # Read the contents of the file
    with open(filename, "r") as file:
        content = file.read()

    # Split the content based on white space
    sections = content.split("\n\n")
    truncated_sections = sections[:500]
    truncated_content = "\n\n".join(truncated_sections)

    with open(output_filename, "w") as file:
        file.write(truncated_content)