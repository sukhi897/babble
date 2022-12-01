// Function to check email id is valid or not
bool isValidEmail(String email) {
  // Check the first character
  if (!((email[0].compareTo('a') >= 0 && email[0].compareTo('z') <= 0) ||
      (email[0].compareTo('A') >= 0 && email[0].compareTo('Z') <= 0))) {
    // If it's not an alphabet email id is not valid
    return false;
  }

  // Variable to store position of At(@) and Dot(.)
  int At = -1, Dot = -1;
  // Traverse over the email id string to find position of Dot and At
  for (int i = 0; i < email.length; i++) {
    // If the character is '@'
    if (email[i] == '@') {
      At = i;
    }
    // If character is '.'
    else if (email[i] == '.') {
      Dot = i;
    }
  }

  // If At or Dot is not present
  if (At == -1 || Dot == -1) return false;
  // If Dot is present before At
  if (At > Dot) return false;
  // If Dot is present at the end
  return !(Dot >= (email.length - 1));
}
