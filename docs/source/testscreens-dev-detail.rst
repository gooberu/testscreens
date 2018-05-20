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
#. Ubuntu Font Family at download-UbuntuFontFamily_


.. _readthedocs: https://readthedocs.org/
.. _gooberu-testscreens-readthedocs: http://testscreens.readthedocs.io/en/latest/
.. _gooberu-testscreens-github: https://github.com/gooberu/testscreens
.. _download-UbuntuFontFamily: https://fonts.google.com/download?family=Ubuntu
.. _testscreens-checkpoint-01: https://github.com/gooberu/testscreens/tree/testscreens-checkpoint-01
.. _testscreens-checkpoint-02: https://github.com/gooberu/testscreens/tree/testscreens-checkpoint-02
.. _testscreens-checkpoint-03: https://github.com/gooberu/testscreens/tree/testscreens-checkpoint-03
.. _testscreens-checkpoint-04: https://github.com/gooberu/testscreens/tree/testscreens-checkpoint-04

