var Hacker = {};

Hacker.getStories = function() {
  $.ajax({
    url: '/Stories.json',
    dataType: 'json',
    success: function(data) {
      Hacker.renderStories(data);
    }
  });
};

Hacker.createstory = function() {
  var title = $('#story-title-field').val();
  var link = $('#story-link-field').val();
  var body = $('#story-body-field').val();
  $('#story-title-field').val('');
  $('#story-link-field').val('');
  $('#story-body-field').val('');
  $.ajax({
    url: '/Stories/create',
    type: 'story',
    data: {title: title, link: link, body: body},
    dataType: 'json',
    success: function(data) {
      $('#Stories').append("<div id='story-" + data.id + "'> <img src='https://news.ycombinator.com/grayarrow.gif' alt='up arrow' class='' /> <span class='story-title'>" + data.title + "</span> </div>");
      Hacker.setstoryHandler(data.id);
    }
  });
};

Hacker.setstoryHandler = function(story_id) {
  $('#story-' + story_id).click(function(e){
    e.preventDefault();
    $.ajax({
      url: '/Stories/' + story_id, 
      dataType: 'json',
      success: function(data) {
        if($('#single-story-' + data.id).length === 0) {
          return "";
        }
        $('#story-' + data.id).append("<div id='single-story-" + data.id + "'> <span class='story-link'>" + data.link + "</span> <span class='story-body'>" + data.body + "</span> </div>");
      }
    });
  })
};

Hacker.renderStories = function(data) {
  $(data).each(function(index, story) {
    $('#Stories').append("<div id='story-" + story.id + "'> <img src='https://news.ycombinator.com/grayarrow.gif' alt='up arrow' /> <span class='story-title'>" + story.title + "</span> </div>");
  });
};

Hacker.upVote = function() {

};

$(document).ready(function() {
  Hacker.getStories();
  $('#story-create-button').click(function(e) {
    e.preventDefault();
    Hacker.createstory();
    })
});