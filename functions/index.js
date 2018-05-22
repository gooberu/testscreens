const functions = require('firebase-functions');
const admin = require('firebase-admin');

admin.initializeApp(functions.config().firebase);

exports.onLikeSubject = functions.firestore
    .document('/likes/{likeId}')
    .onCreate(event => {
        let subjectId, userId;
        [subjectId, userId] = event.params.likeId.split(':');

        const db = admin.firestore();
        const subjectRef = db.collection('subjects').doc(subjectId);
        db.runTransaction(t => {
            return t.get(subjectRef)
                .then(doc => {
                    t.update(subjectRef, {
                        like_counter: (doc.data().like_counter || 0) + 1
                    });
                })
        }).then(result => {
            console.log('Increased aggregate subject like counter.');
        }).catch(err => {
            console.log('Failed to increase aggregate subject like counter.', err);
        });
    });

exports.onUnlikeSubject = functions.firestore
    .document('/likes/{likeId}')
    .onDelete(event => {
        let subjectId, userId;
        [subjectId, userId] = event.params.likeId.split(':');

        const db = admin.firestore();
        const subjectRef = db.collection('subjects').doc(subjectId);
        return db.runTransaction(t => {
            return t.get(subjectRef)
                .then(doc => {
                    t.update(subjectRef, {
                        like_counter: (doc.data().like_counter || 0) - 1
                    });
                })
        }).then(result => {
            console.log('Decreased aggregate cat like counter.');
        }).catch(err => {
            console.log('Failed to decrease aggregate cat like counter.', err);
        });
    });
