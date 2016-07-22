$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()

  // To count the remaining characters when writing a tweet
  var maxChars = 140;
  $('#count_message').html(maxChars + ' remaining');

  $('#tweet_content').keyup(function() {
    var tweetLength = $('#tweet_content').val().length;
    var textRemaining = maxChars - tweetLength;

    $('#count_message').html(textRemaining + ' remaining');
  });
});
