import csv
import yaml
import sys
import os

def read_csv(csv_file):
    tests = {}
    with open(csv_file, 'r') as f:
        reader = csv.DictReader(f)
        for row in reader:
            table = row['table']
            column = row['column']
            test = {
                'operator': row['operator'],
                'value': int(row['value']) if row['value'].isdigit() else row['value'],
                'expected': int(row['expected']) if row['expected'].isdigit() else row['expected']
            }
            if table not in tests:
                tests[table] = {}
            if column not in tests[table]:
                tests[table][column] = []
            tests[table][column].append(test)
    return tests

def update_yaml(yaml_file, tests):
    with open(yaml_file, 'r') as f:
        data = yaml.safe_load(f)

    for table in data['tables']:
        table_name = table['name']
        if table_name in tests:
            for column in table['columns']:
                column_name = column['name']
                if column_name in tests[table_name]:
                    if 'tests' not in column:
                        column['tests'] = {'assertion': []}
                    column['tests']['assertion'].extend(tests[table_name][column_name])

    with open(yaml_file, 'w') as f:
        yaml.dump(data, f, sort_keys=False)

def main():
    if len(sys.argv) != 3:
        print("Usage: python rosetta_add_tests.py <path_to_model.yaml> <path_to_csv_input>")
        sys.exit(1)

    yaml_file = sys.argv[1]
    csv_file = sys.argv[2]

    if not os.path.isfile(yaml_file):
        print(f"File {yaml_file} does not exist.")
        sys.exit(1)

    if not os.path.isfile(csv_file):
        print(f"File {csv_file} does not exist.")
        sys.exit(1)

    tests = read_csv(csv_file)
    update_yaml(yaml_file, tests)

    print("YAML file updated successfully.")

if __name__ == "__main__":
    main()
