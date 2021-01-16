#!/usr/bin/env python3
"""Generate random password using alphanumeric characters.

Length of the password will be 10 chars by default. user is allowed to specify the
length if required.
"""
import sys
import random
import argparse

_DEFAULT_LENGTH = 10


def generate_password(args):
    """Generate random characters based on the length of the password."""
    chars_base = [chr(x) for x in range(48, 123) if x <= 57 or 65 <= x <= 90 or 97 <= x <= 122]
    random_chars = random.choices(chars_base, k=args.password_length)

    # Concatenate all the random chars
    return "".join(random_chars)


def password_length(pass_len):
    """Validate the password length given by the user and raise an exception if any error."""
    if not pass_len.isdigit() or not 5 < int(pass_len) < 128:
        raise argparse.ArgumentTypeError('Password length should be between 6 and 127')

    return int(pass_len)


def main():
    """Generate random password using alphanumeric characters."""
    parser = argparse.ArgumentParser(description="Generate random password")
    parser.add_argument("-l", "--password_length", type=password_length, default=_DEFAULT_LENGTH,
                        required=False, help="Length of the password")
    args = parser.parse_args()
    random_password = generate_password(args)
    print("\nPassword: {}\n".format(random_password))


if __name__ == "__main__":
    main()
    sys.exit(0)
