# MODEL - CONVERSATIONAL AGENT
##To run the Model, create a virtual environment on the terminal using

C:\> python3 -m venv ./venv

##Activate the virtual environment

C:\> .\venv\Scripts\activate

##Use pip to install dependencies; 

pip3 install -U --user pip && pip3 install rasa

##Navigate to saved folder/location. Enter IMED

rasa run //Initiates server

rasa shell //Start shell user session, can interact

rasa interactive //Shows decision making and classification

##For my project, I hosted the server on my machine and could connect to the agent
via all devices on the network;

rasa run -p 5005 -i <machine-ip> --enable-api


# FLUTTER APPLICATION
Download code, launch project on Android Studio or other suitable editor.
Run the main.dart file to launch app on emulator or phone

Alternatively, go to build/outputs/apks for the android apk. 

