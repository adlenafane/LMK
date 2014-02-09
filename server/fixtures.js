if (Questions.find().count() === 0) {
    Questions.insert({
        question: "What is your home town?",
        author: "Julie",
        recipient: "Adlen",
        answer: "St Leu"
    });

    Questions.insert({
        question: "What is your favorite color?",
        author: "Julie",
        recipient: "Adlen",
        answer: "Blue"
    });

    Questions.insert({
        question: "What is your favorite laptop brand?",
        author: "Julie",
        recipient: "Adlen",
        answer: "Dell"
    });
}