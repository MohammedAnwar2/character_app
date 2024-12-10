int getCrossAxisCount(double width) {
  if (width < 380) {
    return 1;
  } else if (width < 600) {
    return 2;
  } else if (width < 800) {
    return 3;
  } else if (width < 1200) {
    return 4;
  } else if (width < 1500) {
    return 5;
  } else {
    return 6;
  }
}
