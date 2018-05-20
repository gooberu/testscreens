Flutter dev testscreens
=======================

====================
Test App for screens
====================

screens smoke app
-----------------

Screencasts
-----------


#. tc159_ Demo the Secret Sauce

#. tc461_ Explains main.dart structure



.. _tc159: https://youtu.be/w2TcYP8qiRI?list=PLlpxjI4sVd-zZ1jpJHJMSHGiWInsvwwf_&t=159
.. _tc461: https://youtu.be/w2TcYP8qiRI?list=PLlpxjI4sVd-zZ1jpJHJMSHGiWInsvwwf_&t=461




=================
Github Quickstart
=================

#. Goto _udemy-flutter-catbox-github
#. cd ~/bast23 && gitclone https://github.com/t04glovern/catbox.git
#. cd catbox
#. Setup firebase-catbox_ firebase project
    #. Goto firebase-catbox_
    #. Click "Authentication" in the left-hand menu
    #. Click the "sign-in method" tab
    #. Click "anonymous" and enable it
#. Android Setup
    #. Change android/app/src/build.gradle line 28: applicationId "me.bast23.catbox"
    #. Register App via firebase-catbox_
    #. Follow instructions to download google-services.json, and place it into catbox/android/app/
    #. Run the following command to get your SHA-1 key:

        keytool -exportcert -list -v \
        -alias androiddebugkey -keystore ~/.android/debug.keystore

    #. In the Firebase console, in the settings of your Android app, add your SHA-1 key by clicking "Add Fingerprint".

==========
References
==========

 + Tutorial via udemy "The Complete Flutter and Firebase Developer Course" see udemy-flutter-catbox-tutorial_
 + Github source for tutorial udemy-flutter-catbox-github_ 
 + Firebase console for firebase-catbox_ project database

.. _udemy-flutter-catbox-tutorial: https://youtu.be/w2TcYP8qiRI?list=PLlpxjI4sVd-zZ1jpJHJMSHGiWInsvwwf_
.. _udemy-flutter-catbox-github: https://github.com/t04glovern/catbox/
.. _udemy-flutter-catbox-code-github: https://github.com/t04glovern/catbox-code/
.. _firebase-catbox: https://console.firebase.google.com/project/testscreens/overview
