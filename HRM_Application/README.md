# Employee Management System

The Employee Management System is a simple Ruby program that allows users to manage employee information. It includes functionalities to create employee instances, view reporting information, apply for leave, search for employees by name, and compare two employees based on their attributes.

## Employee Class

The `Employee` class is the core component of the system. It has the following attributes:

- `empid`: Employee ID
- `name`: Employee's full name
- `age`: Employee's age
- `doj`: Date of joining (DOJ) in the format "YYYY-MM-DD"
- `rating`: Employee's performance rating
- `reporting_to`: Employee's reporting manager

### Class Methods

1. `initialize`: Constructor to initialize the employee attributes.
2. `reporting`: Display the reporting information of the employee.
3. `apply_leave(days)`: Apply for leave, specifying the number of days.
4. `==`: Custom comparison method to check if two employees are equal based on their `rating` and `doj`.
5. `self.search_by_name(list, name)`: Class method to search for an employee by name in a given list.

## Usage

1. Run the Ruby script containing the provided code.
2. The program will display information about `employee2` (Barath), including the reporting manager.
3. Enter the number of days an employee wants to apply for leave when prompted. The program will display the leave application details.
4. Enter the name of an employee you want to search for.
5. The program will show the details of the found employee (if exists) or display a message indicating that the employee was not found.
6. The program will compare `employee4` (Vinoth) with the first employee in the list and indicate whether they are equal or not based on their `rating` and `doj`.

## Employee Data

The provided code contains information for three employees:

1. Akash
   - Employee ID: 1
   - Age: 20
   - DOJ: 2023-04-18
   - Rating: 4.5
   - Reporting To: Manager

2. Barath
   - Employee ID: 2
   - Age: 21
   - DOJ: 2023-06-26
   - Rating: 4.8
   - Reporting To: Team Lead

3. Openheimer
   - Employee ID: 3
   - Age: 23
   - DOJ: 2022-11-20
   - Rating: 4.2
   - Reporting To: Manager

## Contributions

Contributions to the Employee Management System are welcome. If you find any bugs, have suggestions, or want to add new features, feel free to open an issue or submit a pull request.

## License

The Employee Management System is open-source and available under the [MIT License](./LICENSE). Feel free to use, modify, and distribute the code as per the terms of the license.
