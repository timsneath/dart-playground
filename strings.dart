String reverse(String str) {
  String str2 = '';
  
  for (var i = str.length - 1; i >= 0; i--) {
    str2 += str[i];
  }
  return str2;
}



void main() 
{
  print(reverse('Hello world'));
}