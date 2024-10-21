import sys

def factorial(n):
    if n == 0 or n == 1:
        return 1
    else:
        return n * factorial(n - 1)

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python factorial.py <number>")
    else:
        number = int(sys.argv[1])  # Corrected this line
        result = factorial(number)
        print(f"The factorial of {number} is {result}")
