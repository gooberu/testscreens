testscreens dev detail
======================

Steps
-----

#. Create new Flutter Application

   #. Fire up Andriod Studio
   #. Start a new Flutter project
   #. Flutter Application
   #. Project name: testscreens
   #. Project location: /Users/cat/bast23
   #. Description: GooberU testscreens flutter application
   #. Comany domain: bast23.me
   #. Package name: me.bast23.testscreens

#. Pull in docs structure

   #. Command line ::

        macci:testscreens cat$ cd ~/bast23/testscreens
        macci:testscreens cat$ cp -r ~/temp/flutter/docs .
        macci:testscreens cat$ vi docs/conf.py
        macci:testscreens cat$ vi docs/index.rst (and various others)
        macci:testscreens cat$ cd docs
        macci:docs cat$ make html (fix errors)
        macci:docs cat$ open build/html/index.html

   #. verify docs

#. Clean up code, begin structure for User Interface (UI).
    #. Clear out comments in pubspec.yaml
    #. Clean up lib/main.dart
    #. Create lib/ui/subject_list.dart
    #. Update test/widget_test.dart

#. Run testscreens flutter application baseline

   #. Command line ::

        macci:testscreens cat$ cd ~/bast23/testscreens
        macci:testscreens cat$ flutter packages get
        macci:testscreens cat$ flutter run

   #. Verify baseline application deploys and runs

#. Adjust .gitignore

#. Produce testscreens-checkpoint-01_

   #. Command line ::

        macci:testscreens cat$ cd ~/bast23/testscreens/docs
        macci:docs cat$ vi source/testscreens-dev-detail.rst (update doc)
        macci:docs cat$ make html 
        macci:docs cat$ open build/html/index.html (verify docs)
        macci:testscreens cat$ cd ~/bast23/testscreens
        macci:testscreens cat$ git add *
        macci:testscreens cat$ git commit -m "commit for testscreens-checkpoint-01"
        macci:testscreens cat$ git tag testscreens-checkpoint-01
        macci:testscreens cat$ git push
        macci:testscreens cat$ git push origin testscreens-checkpoint-01
    
   #. Verify checkpoint testscreens-checkpoint-01_ Baseline

#. Create gooberu-testscreens-readthedocs_

    #. Go to readthedocs_
    #. Sign up username: gooberu
    #. Attach github user: gooberu
    #. Import github gooberu-testscreens-github_ repo
    #. Verify gooberu-testscreens-readthedocs_

#. Add some new Fonts to Project Assets

    #. Download the download-UbuntuFontFamily_ unzip and move to ~/bast23/testscreens/founts

    #. Command line ::

        macci:testscreens cat$ mkdir fonts
        macci:testscreens cat$ cp ~/Downloads/Ubuntu/Ubuntu-Bold.ttf fonts/
        macci:testscreens cat$ cp ~/Downloads/Ubuntu/Ubuntu-Regular.ttf fonts/

    #. Add font assets to pubspec.yaml ::

        fonts:
            - family: Ubuntu
            fonts:
                - asset: fonts/Ubuntu-Regular.ttf
                - asset: fonts/Ubuntu-Bold.tff
                
    #. Add font family Ubuntu in lib/main.dart ::

        class TestScreens extends StatelessWidget {
            @override
            Widget build(BuildContext context) {
                return new MaterialApp(
                theme: new ThemeData(
                    primarySwatch: Colors.blue,
                    accentColor: Colors.deepPurple,
                    fontFamily: 'Ubuntu',
                ),
                home: new SubjectList(),
                );
            }
        }

    #. Fix Unit Tests.  Mod test to check for the "Test Screens" Text.

    #. Fix errors and verify application deploys and runs ::

        macci:testscreens cat$ flutter run

#. Produce testscreens-checkpoint-02_ Add Assets

   #. Command line ::

        macci:testscreens cat$ cd ~/bast23/testscreens/docs
        macci:docs cat$ vi source/testscreens-dev-detail.rst (update doc)
        macci:docs cat$ make html 
        macci:docs cat$ open build/html/index.html (verify docs)
        macci:testscreens cat$ cd ~/bast23/testscreens
        macci:testscreens cat$ git add *
        macci:testscreens cat$ git commit -m "commit for testscreens-checkpoint-02"
        macci:testscreens cat$ git tag testscreens-checkpoint-02
        macci:testscreens cat$ git push
        macci:testscreens cat$ git push origin testscreens-checkpoint-02
    
   #. Verify checkpoint testscreens-checkpoint-02_

#. Create SubjectList Data Model in assets/Subjects.json

    #. Create a JSON data file ::

        {
        "subjects": [
            {
            "subject": "Chemistry",
            "online": true,
            "id": 1,
            "pictures": [
                "http://lorempixel.com/400/200/people",
                "http://lorempixel.com/400/200/technics"
                ],
            "like_counter": 2,
            "location": "St James, WA",
            "tags": ["TauBetaPi", "Chem101Study", "GooberU"],
            "description": "",
            "image_url": "http://via.placeholder.com/100x100"
            },
            {
            "name": "Physics",
            "adopted": false,
            "id": 2,
            "pictures": [
                "http://lorempixel.com/400/200/people",
                "http://lorempixel.com/400/200/technics"
                ],
            "like_counter": 1,
            "location": "St James, WA",
            "tags": ["TauBetaPi", "Chem101Study", "GooberU"],
            "description": "",
            "image_url": "http://via.placeholder.com/100x100"
            }
        ]
        }

    #. Add asset/subject.json to pubspec.yaml
    #. Create object model lib/models/subject.dart
    #. Create service api in lib/services/api.dart
    #. Add _loadSubjects() to _SubjectListState class in lib/ui/subject_list.dart
    #. Create List view for Subjects in lib/ui/subject_list.dart
        #. setState in _loadSubjects
        #. call _buildBody from the build Widget
        #. create _buildBody Widget
        #. create _getListViewWidget
        #. in _buildBody Widget call _getAppTitleWidget() and _getListViewWidget()
        #. create Future<Null> refresh to _loadSubjects on refresh
        #. create _buildSubjectItem Widget.  This builds the nested UI for the subject list elements.

#. Produce testscreens-checkpoint-03_ Subject Model in assets/Subjects.json

   #. Command line ::

        macci:testscreens cat$ cd ~/bast23/testscreens/docs
        macci:docs cat$ vi source/testscreens-dev-detail.rst (update doc)
        macci:docs cat$ make html 
        macci:docs cat$ open build/html/index.html (verify docs)
        macci:testscreens cat$ cd ~/bast23/testscreens
        macci:testscreens cat$ git add *
        macci:testscreens cat$ git commit -m "commit for testscreens-checkpoint-03 - SubjectList Model"
        macci:testscreens cat$ git tag testscreens-checkpoint-03
        macci:testscreens cat$ git push
        macci:testscreens cat$ git push origin testscreens-checkpoint-03
    
   #. Verify checkpoint testscreens-checkpoint-03_

#. Create SubjectList detail view page and navigation

    #. Create ui/subject_details/details_body.dart
    #. Create ui/subject_details/details_page.dart
    #. Create ui/subject_details/header/details_header.dart
    #. Create ui/subject_details/footer/details_footer.dart

#. Create Routes and Navigator

    #. Create ui/utils/routes.dart
    #. Add _navigateToSubjectDetails() to ui/subject_list.dart
    #. Add some basic state and UI returns to _SubjectDetailsPageState Widget in ui/subject_details/details_page.dart
    #. Call _navigateToSubjectDetails() in the onTap: of the ListTitle in ui/subject_list.dart

#. Add ui BACKGROUND_IMAGE

    #. Create directory images
    #. Add images/profile_header_background.png
    #. Add images/profile_header_background.png as asset in pubspec.yaml
    #. Add lib/ui/subject_details/header/subject_colored_image.dart
    #. Add static const BACKGROUND_IMAGE = 'images/profile_header_background.png' to _SubjectDetailsPageState in lib/ui/subject_details/header/details_header.dart
    #. import 'package:testscreens/ui/subject_details/header/subject_colored_image' n lib/ui/subject_details/header/details_header.dart
    #. use DiagonallyCutColoredImage to load the transformed image into diagonalBackground var

#. Add ui Details section

    #. Add theme to _SubjectDetailBody, add text, style, padding to lib/ui/subject_details/details_body.dart
    #. Tweak display and icons.. get used to the ui nesting constuction
    #. Add _createCircleBadge function call to build up icons for future controls
    #. Add new Padding to pull in the new view

#. Add in Showcase section using tabs

    #. Create lib/ui/subject_details/footer/details_footer.dart 
    #. Add TabBar and _controller
    #. Create lib/ui/subject_details/footer/showcase_badges.dart 
    #. Create lib/ui/subject_details/footer/showcase_pictures.dart 
    #. Create lib/ui/subject_details/footer/showcase_details.dart 
    #. Pull in Showcase in lib/ui/subject_details/details_page.dart

#. Finish off Showcase TabBar views

    #. Add font_awesome_flutter to pubspec.yaml
    #. in showcase_details.dart add call to subject details data object and display
    #. in showcase_pictures.dart add call to subject pictures (multiple) data objects and display in grid
    #. in showcase_badges.dart add call to subject badges icon data object and display

#. Run and debug

    #. Debug badges mapping and how object is passed and icons generated
    #. FIX a assets/subjects.json JSON data file ::

        {
            "subjects": [
                {
                "name": "Chemistry",
                "online": true,
                "id": 1,
                "pictures": [
                    "http://lorempixel.com/400/200/people",
                    "http://lorempixel.com/400/200/technics"
                    ],
                "like_counter": 2,
                "location": "St James, WA",
                "badges": ["TauBetaPi", "Chemistry101Study", "GooberU"],
                "description": "Test Description 1",
                "image_url": "http://via.placeholder.com/100x100"
                },
                {
                "name": "Physics",
                "online": false,
                "id": 2,
                "pictures": [
                    "http://lorempixel.com/400/200/people",
                    "http://lorempixel.com/400/200/technics"
                    ],
                "like_counter": 1,
                "location": "St James, WA",
                "badges": ["TauBetaPi", "Physics101Study", "GooberU"],
                "description": "Test Description 2",
                "image_url": "http://via.placeholder.com/100x100"
                }
            ]
            }

    #. Fix the naming effects tags -> badges and subjectBadgeLookup
    #. Consider moving subjectBadgeLookup to another resource... just not now
    #. Having some cache issues (I think)
    #. Things seem to work fine just sometimes the pictures are delayed...
    #. Good enough to snapshot

#. Produce testscreens-checkpoint-04_ Subject List Detail view and navigation

   #. Command line ::

        macci:testscreens cat$ cd ~/bast23/testscreens/docs
        macci:docs cat$ vi source/testscreens-dev-detail.rst (update doc)
        macci:docs cat$ make html 
        macci:docs cat$ open build/html/index.html (verify docs)
        macci:testscreens cat$ cd ~/bast23/testscreens
        macci:testscreens cat$ git add *
        macci:testscreens cat$ git commit -m "commit for testscreens-checkpoint-04 - SubjectList Detail View"
        macci:testscreens cat$ git tag testscreens-checkpoint-04
        macci:testscreens cat$ git push
        macci:testscreens cat$ git push origin testscreens-checkpoint-04
    
    #. Verify checkpoint testscreens-checkpoint-04_

#. Create Android Google-Sign-In API Integration for testscreens-checkpoint-05_

    #. Firebase console setup at firebase-console_
    #. Add Project
        #. Project name: testscreens
        #. Project ID: gooberu-testscreens
        #. Region: United States
    #. Add Android App to Firebase Project: testscreens
        #. On firebase-testscreens-console_ click Add Android
        #. Android package name: me.bast23.testscreens
        #. App nickname: testscreens
        #. Debug signing certificate SHA-1 see firebase-debug-cert_
            #. open a terminal
            #. keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android
            #. Copy Paste SHA-1
        #. Download google-services.json
        #. move to android/app/google-services.json
            #. mv ~/Downloads/google-services.json android/app/
        #. Add google services to android/build.gradle
            #. classpath 'com.google.gms:google-services:3.2.0'
        #. Add apply plugin to android/app/build.gradle AT THE END OF THE FILE
            #. apply plugin: 'com.google.gms.google-services'
        #. Add firebase packages to pubspec.yaml
            #. firebase_core: "0.1.0"
            #. firebase_auth: "0.5.3"
            #. cloud_firestore: "0.3.0"
            #. google_sign_in: "3.0.0"
        #. flutter run (verify application will still build)
    #. Add Authentication via google_sign_in
        #. Goto firebase-testscreens-Authentication_
        #. Click on "SIGN-IN METHOD"
        #. Click on Google, then click Enable
            #. I set Project public-facing name: project-testscreens
            #. Click "SAVE"
        #. Edit lib/services/api.dart
            #. Add imports firebase_auth, google_sign_in and async
            #. Add calls to FirebaseAuth and GoogleSignIn in class SubjectApi
        #. Edit lib/ui/cat_list.dart
            #. Add SubjectApi
            #. Add NetworkImage
            #. Add _loadFromFirebase() async
            #. Call _loadFromFirebase() in the initState
            #. Add floating action button to UI
            #. Attach google_sign_in indication to tool-tip
            #. Add backgroundImage: _profileImage
        #. flutter run

#. Produce testscreens-checkpoint-05_ Android Google-Sign-In API Integration

   #. Command line ::

        macci:testscreens cat$ cd ~/bast23/testscreens/docs
        macci:docs cat$ vi source/testscreens-dev-detail.rst (update doc)
        macci:docs cat$ make html 
        macci:docs cat$ open build/html/index.html (verify docs)
        macci:testscreens cat$ cd ~/bast23/testscreens
        macci:testscreens cat$ git add *
        macci:testscreens cat$ git commit -m "commit for testscreens-checkpoint-05 - Google-Sign-In API Integration"
        macci:testscreens cat$ git tag testscreens-checkpoint-05
        macci:testscreens cat$ git push
        macci:testscreens cat$ git push origin testscreens-checkpoint-05
    
   #. Verify checkpoint testscreens-checkpoint-05_

#. Create Firebase Cloud Firestore for testscreens-checkpoint-06_

#. Setup database backend

    #. Goto firebase-testscreens-Database_
    #. Click Cloud Firestore "Get Started"
    #. Click "Locked Mode" for now (we are using the SHA-1) 
    #. Add new Collection: subjects
    #. Manually add the subjects.json data
    #. Goto firebase-testscreens-Storage_
    #. Click "Get Started"
    #. Accept default rules
    #. Click "RULES" which is firebase-testscreens-Storage-Rules_
    #. Change "allow read, write: if request.auth != null;" to "allow read;"
    #. Upload images to firebase-testscreens-Storage-Files_
    #. Replace Database url links with links from firebase-testscreens-Storage-Files_

#. Integration of Firebase into Flutter Application

    #. Edit lib/services/api.dart
        #. import 'package:cloud_firestore/cloud_firestore.dart'
        #. Add _fromDocumentSnapshot to Subject extension
        #. Add Future<List<Subject>> getAllSubjects
        #. Add StreemSubscription to Subject
    #. Edit lib/ui/subject_list.dart
        #. comment out _loadSubjects in initState
        #. Add subjects api call to _loadFromFirebase
        #. comment out _loadSubjects()
        #. Create _reloadSubjects
        #. call _reloadSubjects from initState and refresh
    #. Edit lib/models/subject.dart
        #. Add documentId
    #. Click "RULES" which is firebase-testscreens-Database-Rules_
    #. Change Rule to Following::

        service cloud.firestore {
            match /databases/{database}/documents {

                //Allow public read access to all subjects
                match /subjects/{subjectId} {
                    allow read;
                }
                function isSignedIn() {
                    return request.auth != null;
                }
            }
        }

    #. flutter run (test it)
        #. CRAP ERROR::

            I/zygote64(22792): Do partial code cache collection, code=59KB, data=44KB
            I/zygote64(22792): After code cache collection, code=56KB, data=43KB
            I/zygote64(22792): Increasing code cache capacity to 256KB
            E/flutter (22792): [ERROR:topaz/lib/tonic/logging/dart_error.cc(16)] Unhandled exception:
            E/flutter (22792): PlatformException(Error performing getDocuments, PERMISSION_DENIED: Missing or insufficient permissions., null)
            E/flutter (22792): #0      StandardMethodCodec.decodeEnvelope (package:flutter/src/services/message_codecs.dart:547:7)
            E/flutter (22792): #1      MethodChannel.invokeMethod (package:flutter/src/services/platform_channel.dart:279:18)
        
        #. THAT may have been the firebase-testscreens-Database-Rules_ change did not take effect yet.... waiting.
        #. WORKS... THANK THE CODE GODS...

#. Produce testscreens-checkpoint-06_ Firebase Cloud Firestore

   #. Command line ::

        macci:testscreens cat$ cd ~/bast23/testscreens/docs
        macci:docs cat$ vi source/testscreens-dev-detail.rst (update doc)
        macci:docs cat$ make html 
        macci:docs cat$ open build/html/index.html (verify docs)
        macci:testscreens cat$ cd ~/bast23/testscreens
        macci:testscreens cat$ git add *
        macci:testscreens cat$ git commit -m "commit for testscreens-checkpoint-06 - Firebase Cloud Firestore"
        macci:testscreens cat$ git tag testscreens-checkpoint-06
        macci:testscreens cat$ git push
        macci:testscreens cat$ git push origin testscreens-checkpoint-06
    
   #. Verify checkpoint testscreens-checkpoint-06_

#. Create Cloud Functions for testscreens-checkpoint-07_

    #. Goto firebase-testscreens-Functions_
    #. Click Functions "Get Started"
    #. sudo npm install -g firebase-tools 
    #. cd ~/bast23/testscreens
    #. firebase login
    #. firebase init
        #. Firestore
        #. Functions
        #. Storage
        #. Firebase Project: testscreens (gooberu-testscreens)
        #. Firestore Rules: (use default)
        #. Firestore indexes: (use default)
        #. Language for Cloud Functions: JavaScript
        #. use ESLint: no
        #. Install dependencies with npm: Y
        #. Storage Rules: (use default)

    #. Update firestore.rules with the following::

        //
        // General Firestore Rules.
        //
        service cloud.firestore {
            match /databases/{database}/documents {
                // Allow public read access to all subjects.
                match /subjects/{subjectId} {
                    allow read;
                }
                // Documents representing likes should be private to their owning users.
                match /likes/{likeId} {
                    allow create: if isSignedIn()
                                && request.resource.data.size() == 0
                                && exists(/databases/$(database)/documents/subjects/$(subjectIdFromLikeId(likeId)));
                    allow get, delete: if isSignedIn()
                                        && userIdFromLikeId(likeId) == request.auth.uid;
                }
                function isSignedIn() {
                    return request.auth != null;
                }
                function subjectIdFromLikeId(likeId) {
                    return likeId.split(':')[0]
                }
                function userIdFromLikeId(likeId) {
                    return likeId.split(':')[1];
                }
            }
        }

    #. Update storage.rules with the following::

        service firebase.storage {
            match /b/{bucket}/o {
                match /{allPaths=**} {
                    allow read;
                }
            }
        }

    #. Verify you can create likes document location in firebase-testscreens-Database_
    #. Delete likes document
    #. Deploy firebase changes
        #. firebase deploy
    #. Write likes cloud function in functions/index.js
    #. cd ~/bast23/testscreens/functions
    #. npm install
    #. cd ~/bast23/testscreens
    #. firebase deploy
    #. Had an error... looked at ; ... deployed again and it worked
    #. Update .gitignore
    #. git add *
    #. git commit -m "Working push to Firebase Functions"

#. Add cloud functions to application
    #. Edit lib/services/api.dart
        #. Add Future likeSubject(Subject subject) async {....}
        #. Add Future unlikeSubject(Subject subject) async {....}
        #. Add Future hasLikedSubject(Subject subject) async {....}
    #. Edit lib/ui/subject_details/header/details_header.dart
        #. import 'dart:async';
        #. import 'package:testscreens/services/api.dart';
        #. Add _likeDisabled, _likeText and _likeCounter logic to _CatDetailHeaderState
        #. Add StreamSubscription _watcher;
        #. Add Future<SubjectApi> _api;
        #. Add the async logic for dynamic like button logic

#. Issues with .gitignore
    #. Got the following message:: 

        Warning: GitGuardian detected an API key from Google
        Hello @christrees
        GitGuardian detected an API key from Google in the following commit from gooberu/testscreens pushed at 2018-05-21T20:35:19Z.
        GitGuardian, or "GG", is a "Good Guy" bot scanning in real time GitHub commits for sensitive information.
        Once you have pushed sensitive information to GitHub, this information is public and should be considered compromised. We just open sourced our GitHub repository to help developers take appropriate actions. Would love a star! :)
        Accidents happened to the best of us and will continue to happen. Sign up to our service to be notified if this happens again. We got a free tier for individual developers !

    #. Mod .gitignore to ignore keys

#. Produce testscreens-checkpoint-07_ Cloud Functions

   #. Command line ::

        macci:testscreens cat$ cd ~/bast23/testscreens/docs
        macci:docs cat$ vi source/testscreens-dev-detail.rst (update doc)
        macci:docs cat$ make html 
        macci:docs cat$ open build/html/index.html (verify docs)
        macci:testscreens cat$ cd ~/bast23/testscreens
        macci:testscreens cat$ git add *
        macci:testscreens cat$ git commit -m "commit for testscreens-checkpoint-07 - Cloud Functions"
        macci:testscreens cat$ git tag testscreens-checkpoint-07
        macci:testscreens cat$ git push
        macci:testscreens cat$ git push origin testscreens-checkpoint-07
    
   #. Verify checkpoint testscreens-checkpoint-07_

#. Create iOS Google-Sign-In API Integration for testscreens-checkpoint-08_

    #. Firebase console setup at firebase-console_
    #. Edit testcreens Project
        #. Project name: testscreens
        #. Project ID: gooberu-testscreens
        #. Region: United States
    #. Add iOS App to Firebase Project: testscreens
        #. On firebase-testscreens-console_ click Add iOS
        #. iOS package name: me.bast23.testscreens
        #. App nickname: testscreens
        #. App Store ID (optional): leave blank for now
        #. Click "Resister APP"
    #. Download GoogleService-Info.plist
        #. move to ios/Runner/GoogleService-Info.plist
            #. mv ~/Downloads/GoogleService-Info.plist ios/Runner/GoogleService-Info.plist
            #. NOTE: best if you move this via xcode IDE as xcode will add to project properly
        #. Edit ios/Runner/info.plist and insert between outer <dict></dict> ::

            <!-- Place between dict and after the following key -->
            <key>UIViewControllerBasedStatusBarAppearance</key>
            <false/>
            <!-- Google Sign-in Section -->
            <key>CFBundleURLTypes</key>
            <array>
                <dict>
                    <key>CFBundleTypeRole</key>
                    <string>Editor</string>
                    <key>CFBundleURLSchemes</key>
                    <array>
                        <!-- Copied from GoogleServices-Info.plist key REVERSE_CLIENT_ID -->
                        <string>com.googleusercontent.apps.466218294969-5mdmh6opkqd87a5m81nm83u4eqd3bvgk</string>
                    </array>
                </dict>
            </array>
            <!-- End of the Google Sign-in Section -->

    #. Add Firebase SDK via CocoaPods
        #. cd ~/bast23/testcreens/ios
        #. pod install
        #. NOTE: I had some issues with pod and xcode
        #. Useful tutorial youtube-FlutterWireUpFirebaseAuthiOS_
        #. cd ~/bast23/testscreens
        #. flutter build ios
        #. Fire up xcode and select a team (for the bundel key stuff)
        #. NOTE: More issues but I think it was because the GoogleServices-Info.plist mod I was using was wrong.  When I corrected the info.plist with the ABOVE mod, the other hacks I did were backed out and everything seemed to work as expected.
        #. NOTE: Mods made ( ///-cathack mistake ) and backed out:
            #. ~/bast23/testscreens/ios/Runner/Runner/AppDelegate.m
            #. ~/bast23/testscreens/ios/Runner/Runner/AppDelegate.h
    #. flutter devices (list the devices)
    #. flutter run -d all (run the app on all connected devices)
    #. flutter run (verify application will still build)

#. Produce testscreens-checkpoint-08_ iOS Google-Sign-In API Integration

   #. Command line ::

        macci:testscreens cat$ cd ~/bast23/testscreens/docs
        macci:docs cat$ vi source/testscreens-dev-detail.rst (update doc)
        macci:docs cat$ make html
        macci:docs cat$ open build/html/index.html (verify docs)
        macci:testscreens cat$ cd ~/bast23/testscreens
        macci:testscreens cat$ git add *
        macci:testscreens cat$ git commit -m "commit for testscreens-checkpoint-08 - Google-Sign-In API Integration"
        macci:testscreens cat$ git tag testscreens-checkpoint-08
        macci:testscreens cat$ git push
        macci:testscreens cat$ git push origin testscreens-checkpoint-08

   #. Verify checkpoint testscreens-checkpoint-08_

#. Setup iOS TestFlight for testscreens-checkpoint-09_

    #. Open testscreens in xcode  
    #. Runner -> General -> Display Name: GooberU
    #. Product -> Achive ( this will take a while to run Version 0.1.0 built 1 ) 
    #. BUILD FAIL: looking at output::

        ========================================================================
        ERROR: Flutter archive builds must be run in Release mode.

        To correct, run:
        flutter build ios --release

        then re-run Archive from Xcode.
        ========================================================================
        Command /bin/sh failed with exit code 255

    #. flutter build ios --release
    #. re-run Product -> Achive ( this will take a while to run Version 0.1.0 built 1 ) 
    #. Eventually you should get the Window -> Organizer view of builds where you can make notes.
    #. Click "Upload to App Store"
        #. Accept Defaults..
        #. Generate an iOS Distribution certificate.
        #. Export Signing certificate to ~/bast23/SigningCerts
        #. Should get Review Runner.ipa screenshot to ~/bast23/SigningCerts/GooberU-Runner-ipa-2018-05-26at4.56.17PM
        #. Export to ~/bast23/SigningCerts/GooberU-Runner2018-05-26at16-59-45
        #. Click "Upload"
    #. Got Error "No suitable application records were found" for me.bast23.testscreens
    #. Click "Export" and save to ~/bast23/SigningCerts/GooberU-ERROR-Runner2018-05-26at17-02-03
    #. Goto apple-developer-portal_ login
    #. Goto apple-developer-bundle-create_
        #. Name: GooberU TestScreens
        #. App ID Prefix: 32S72FZ9Z5 (Team ID)
        #. App ID Suffix (Bundle ID): me.bast23.testscreens
        #. Use Default App services
        #. Click "Continue"
        #. App ID Description:GooberU TestscreensIdentifier:32S72FZ9Z5.me.bast23.testcreens
        #. Click "Register"
        #. Click "Done"
    #. Goto apple-itunesconnect-portal_
        #. New App
            #. ~/bast23/SigningCerts/GooberU-itunes-newApp-ScreenShot2018-05-26at5.21.40PM
            #. Name: GooberU-Testscreens
            #. Language: English(U.S.)
            #. Bundle ID: GooberU Testscreens - me.bast23.testscreens
            #. SKU: 333666999
    #. Click "Upload to App Store"
        #. Accept Defaults..
        #. Generate an iOS Distribution certificate.
        #. Export Signing certificate to ~/bast23/SigningCerts
        #. Export to ~/bast23/SigningCerts/GooberU-Runner2018-05-26at17-16-41
        #. Click "Upload"
        #. Wait... should get "Upload Successful"
        #. Click "Done"
    #. Goto apple-itunesconnect-portal_
        #. My Apps -> GooberU-Testscreens
        #. Fill out "Test Information"
        #. Click on warning in "iOS Builds" and accept the encryption "No" waring
    #. Goto apple-itunesconnect-user-roles_
        #. Add users to test
        #. Don't messup the email (woops)
        #. Assign roles 
    #. Goto apple-itunesconnect-GooberU-Testscreens-testflight_
        #. Add iTunes Connect Users (internal test)

#. Produce testscreens-checkpoint-09_ Setup iOS TestFlight

   #. Command line ::

        macci:testscreens cat$ cd ~/bast23/testscreens/docs
        macci:docs cat$ vi source/testscreens-dev-detail.rst (update doc)
        macci:docs cat$ make html 
        macci:docs cat$ open build/html/index.html (verify docs)
        macci:testscreens cat$ cd ~/bast23/testscreens
        macci:testscreens cat$ git add *
        macci:testscreens cat$ git commit -m "commit for testscreens-checkpoint-09 - Setup iOS TestFlight"
        macci:testscreens cat$ git tag testscreens-checkpoint-09
        macci:testscreens cat$ git push
        macci:testscreens cat$ git push origin testscreens-checkpoint-09
    
   #. Verify checkpoint testscreens-checkpoint-09_

#. Create NAME_OF_GOAL for testscreens-checkpoint-NN_

    #. github-projects-configure-projects_ setup kanban board
    #. Setup "Subject Chat Page" lib/ui/subject_chat.dart

#. Produce testscreens-checkpoint-NN_ NAME_OF_GOAL

   #. Command line ::

        macci:testscreens cat$ cd ~/bast23/testscreens/docs
        macci:docs cat$ vi source/testscreens-dev-detail.rst (update doc)
        macci:docs cat$ make html 
        macci:docs cat$ open build/html/index.html (verify docs)
        macci:testscreens cat$ cd ~/bast23/testscreens
        macci:testscreens cat$ git add *
        macci:testscreens cat$ git commit -m "commit for testscreens-checkpoint-NN - NAME_OF_GOAL"
        macci:testscreens cat$ git tag testscreens-checkpoint-NN
        macci:testscreens cat$ git push
        macci:testscreens cat$ git push origin testscreens-checkpoint-NN
    
   #. Verify checkpoint testscreens-checkpoint-NN_

#. Create GooberU-UserRequestResponse transactions for testscreens-checkpoint-11_
    #. Open gooberu-docs-Architecture_ and review GooberU-UserRequestResponse Event Model
    #. Goto firebase-testscreens-Database_
    #. Create ~/bast23/testscreens/assets/providers.json
    #. Add new Collection: providers
    #. Manually add the providers.json data structure
        #. cp assets/subjects.json assets/providers.json
        #. Fix providers.json data to aling with gooberu-docs-Architecture_
    #. Manually add lib/models/provider.dart
        #. cp lib/models/subject.dart lib/models/provider.dart
        #. Fix provider.dart model to aling with gooberu-docs-Architecture_
    #. Add class ProviderApi to lib/services/api.dart and fixup errors
        #. import 'package:testscreens/models/provider.dart'
        #. Add _fromDocumentSnapshot to Provider extension
        #. Add Future<List<Provider>> getAllProviders
        #. Add StreemSubscription to Provider
    #. Create lib/ui/provider_list.dart 
        #. ??
    #. Create lib/ui/provider_details/... ??
        #. For now just mod'n subject_details screen to get the screen flow idea...
    #. tbd
    #. Click "RULES" which is firebase-testscreens-Database-Rules_
    #. Change Rule to Following::

        service cloud.firestore {
            match /databases/{database}/documents {

                //Allow public read access to all subjects
                match /subjects/{subjectId} {
                    allow read;
                }
                //Allow public read access to all providers
                match /providers/{providerId} {
                    allow read;
                }                
                function isSignedIn() {
                    return request.auth != null;
                }
            }
        }

    #. flutter run (test it)

#. Produce testscreens-checkpoint-11_ GooberU-UserRequestResponse transactions

   #. Command line ::

        macci:testscreens cat$ cd ~/bast23/testscreens/docs
        macci:docs cat$ vi source/testscreens-dev-detail.rst (update doc)
        macci:docs cat$ make html 
        macci:docs cat$ open build/html/index.html (verify docs)
        macci:testscreens cat$ cd ~/bast23/testscreens
        macci:testscreens cat$ git add *
        macci:testscreens cat$ git commit -m "commit for testscreens-checkpoint-11 - GooberU-UserRequestResponse transactions"
        macci:testscreens cat$ git tag testscreens-checkpoint-11
        macci:testscreens cat$ git push
        macci:testscreens cat$ git push origin testscreens-checkpoint-11
    
   #. Verify checkpoint testscreens-checkpoint-11_


Action Template
---------------

#. Create NAME_OF_GOAL for testscreens-checkpoint-NN_

    #. tbd  
    #. tbd 

#. Produce testscreens-checkpoint-NN_ NAME_OF_GOAL

   #. Command line ::

        macci:testscreens cat$ cd ~/bast23/testscreens/docs
        macci:docs cat$ vi source/testscreens-dev-detail.rst (update doc)
        macci:docs cat$ make html 
        macci:docs cat$ open build/html/index.html (verify docs)
        macci:testscreens cat$ cd ~/bast23/testscreens
        macci:testscreens cat$ git add *
        macci:testscreens cat$ git commit -m "commit for testscreens-checkpoint-NN - NAME_OF_GOAL"
        macci:testscreens cat$ git tag testscreens-checkpoint-NN
        macci:testscreens cat$ git push
        macci:testscreens cat$ git push origin testscreens-checkpoint-NN
    
   #. Verify checkpoint testscreens-checkpoint-NN_

Resources
---------

#. Github Project Repo: gooberu-testscreens-github_
#. Read the Docs: gooberu-testscreens-readthedocs_
#. GooberU site Architecture document at gooberu-docs-Architecture_
#. Ubuntu Font Family at download-UbuntuFontFamily_
#. Firebase console (based on google login) firebase-console_
#. Firebase testscreens console firebase-testscreens-console_
#. Firebase debug cert help firebase-debug-cert_
#. firebase-testscreens-Authentication_
#. firebase-testscreens-Database_
#. firebase-testscreens-Database-Rules_
#. firebase-testscreens-Storage_
#. firebase-testscreens-Storage-Rules_
#. firebase-testscreens-Storage-Files_
#. firebase-docs-database-query_
#. youtube-FlutterWireUpFirebaseAuthiOS_
#. Testflight documentation ios-docs-testflight_
#. Testflight Tutorial youtube-ios-tutorial-testflight-1_


.. _readthedocs: https://readthedocs.org/
.. _gooberu-testscreens-readthedocs: http://testscreens.readthedocs.io/en/latest/
.. _gooberu-testscreens-github: https://github.com/gooberu/testscreens
.. _gooberu-testscreens-release-sprints: https://github.com/gooberu/testscreens/projects
.. _gooberu-docs-Architecture: https://docs.google.com/document/d/1FvM15Qytp0HsxGR6Tm3dTKDvYsCZbecjis9G_oCLgo8
.. _download-UbuntuFontFamily: https://fonts.google.com/download?family=Ubuntu

.. _firebase-console: https://console.firebase.google.com/
.. _firebase-testscreens-console: https://console.firebase.google.com/project/gooberu-testscreens/overview
.. _firebase-testscreens-Authentication: https://console.firebase.google.com/project/gooberu-testscreens/authentication/users
.. _firebase-testscreens-Database: https://console.firebase.google.com/project/gooberu-testscreens/database
.. _firebase-testscreens-Database-Rules: https://console.firebase.google.com/project/gooberu-testscreens/database/firestore/rules
.. _firebase-testscreens-Storage: https://console.firebase.google.com/project/gooberu-testscreens/storage/gooberu-testscreens.appspot.com/files
.. _firebase-testscreens-Storage-Rules: https://console.firebase.google.com/project/gooberu-testscreens/storage/gooberu-testscreens.appspot.com/rules
.. _firebase-testscreens-Storage-Files: https://console.firebase.google.com/project/gooberu-testscreens/storage/gooberu-testscreens.appspot.com/files
.. _firebase-testscreens-Functions: https://console.firebase.google.com/project/gooberu-testscreens/functions/list
.. _firebase-debug-cert: https://developers.google.com/android/guides/client-auth
.. _firebase-docs-database-query: https://firebase.google.com/docs/reference/js/firebase.database.Query
.. _firebase-docs-sheets-connector: https://sites.google.com/site/scriptsexamples/new-connectors-to-google-services/firebase/tutorials

.. _ios-docs-testflight: https://developer.apple.com/testflight/
.. _apple-developer-portal: https://developer.apple.com/account/
.. _apple-developer-bundle-create: https://developer.apple.com/account/ios/identifier/bundle
.. _apple-itunesconnect-portal: https://itunesconnect.apple.com/
.. _apple-itunesconnect-user-roles: https://itunesconnect.apple.com/WebObjects/iTunesConnect.woa/ra/ng/users_roles
.. _apple-itunesconnect-GooberU-Testscreens-Testflight: https://itunesconnect.apple.com/WebObjects/iTunesConnect.woa/ra/ng/app/1390293846/testflight?section=internaltesters&subsection=testers

.. _testscreens-checkpoint-NN: https://github.com/gooberu/testscreens
.. _testscreens-checkpoint-01: https://github.com/gooberu/testscreens/tree/testscreens-checkpoint-01
.. _testscreens-checkpoint-02: https://github.com/gooberu/testscreens/tree/testscreens-checkpoint-02
.. _testscreens-checkpoint-03: https://github.com/gooberu/testscreens/tree/testscreens-checkpoint-03
.. _testscreens-checkpoint-04: https://github.com/gooberu/testscreens/tree/testscreens-checkpoint-04
.. _testscreens-checkpoint-05: https://github.com/gooberu/testscreens/tree/testscreens-checkpoint-05
.. _testscreens-checkpoint-06: https://github.com/gooberu/testscreens/tree/testscreens-checkpoint-06
.. _testscreens-checkpoint-07: https://github.com/gooberu/testscreens/tree/testscreens-checkpoint-07
.. _testscreens-checkpoint-08: https://github.com/gooberu/testscreens/tree/testscreens-checkpoint-08
.. _testscreens-checkpoint-09: https://github.com/gooberu/testscreens/tree/testscreens-checkpoint-09
.. _testscreens-checkpoint-10: https://github.com/gooberu/testscreens/tree/testscreens-checkpoint-10
.. _testscreens-checkpoint-11: https://github.com/gooberu/testscreens/tree/testscreens-checkpoint-11
.. _testscreens-checkpoint-12: https://github.com/gooberu/testscreens/tree/testscreens-checkpoint-12

.. _youtube-FlutterWireUpFirebaseAuthiOS: https://www.youtube.com/watch?v=3nFIMej3Tvw
.. _youtube-ios-tutorial-testflight-1: https://www.youtube.com/watch?v=1CcCKQHjDpw
.. _youtube-ios-tutorial-testflight-2: https://www.youtube.com/watch?v=1DVLaMmGxR8

.. _github-projects-configure-projects: https://help.github.com/articles/configuring-automation-for-project-boards/
