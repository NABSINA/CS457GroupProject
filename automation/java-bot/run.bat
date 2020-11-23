:: create bin directory if it does not exist
if not exist "java-bot/bin" mkdir "java-bot/bin"
:: compile .java files
javac java-bot/src/javabot/*.java -d java-bot/bin
:: run java .class files
java -Dfile.encoding=UTF-8 -cp java-bot/bin javabot.Main %1 %2 %3 %4 %5 %6 %7 %8 %9
