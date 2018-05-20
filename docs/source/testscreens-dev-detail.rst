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

#. Use the skeleton from youtube-flutter-chat-tutorial_ source youtube-flutter-chat-github_

   #. Command line ::

        macci:testscreens cat$ mv lib/main.dart lib/main.dart.flutterbaseline
        macci:testscreens cat$ mv main.dart.txt lib/main.dart
        macci:testscreens cat$ mv platform_adaptive.dart.txt lib/platform_adaptive.dart
        macci:testscreens cat$ mv type_meme.dart.txt lib/type_meme.dart

   #. Fix errors and verify application deploys and runs ::

        macci:testscreens cat$ flutter run

#. Produce testscreens-checkpoint-02_ Basic Chat Screen

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




Resources
---------

#. Github Project Repo: gooberu-testscreens-github_
#. Read the Docs: gooberu-testscreens-readthedocs_
#. Tutorial via GoogleIO-17 "Single Codebase, Two Apps with Flutter and Firebase" see youtube-flutter-chat-tutorial_
#. Github source for tutorial youtube-flutter-chat-github_ 
#. Firebase console for firebase-chat2cld_ project database
#. Github source for memechat-skeleton_


.. _readthedocs: https://readthedocs.org/
.. _gooberu-testscreens-readthedocs: https://gooberu-testscreens.readthedocs-hosted.com/en/latest/index.html
.. _gooberu-testscreens-github: https://github.com/gooberu/testscreens
.. _testscreens-checkpoint-01: https://github.com/gooberu/testscreens/tree/testscreens-checkpoint-01
.. _testscreens-checkpoint-02: https://github.com/gooberu/testscreens/tree/testscreens-checkpoint-02
.. _testscreens-checkpoint-03: https://github.com/gooberu/testscreens/tree/testscreens-checkpoint-03
.. _testscreens-checkpoint-04: https://github.com/gooberu/testscreens/tree/testscreens-checkpoint-04

.. _youtube-flutter-chat-tutorial: https://youtu.be/w2TcYP8qiRI?list=PLlpxjI4sVd-zZ1jpJHJMSHGiWInsvwwf_
.. _youtube-flutter-chat-github: https://github.com/efortuna/memechat
.. _firebase-chat2cld: https://console.firebase.google.com/project/chat2cld/overview
.. _memechat-skeleton: https://github.com/efortuna/memechat/blob/skeleton/lib/main.dart