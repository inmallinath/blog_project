$(document).ready(function(){
  //Load all posts
  $.ajax({
    url: "http://localhost:3000/posts.json",
    method: "GET",
    error: function(){
      alert("Please Reload!");
    },
    success: function(posts){
      $("#posts").html("");
      for(var i=0; i<posts.length; i++){
        var template = $('#post-listing').html();
        var renderedHtml = Mustache.render(template, posts[i]);
        $("#posts").append(renderedHtml);
      }
    }
  });

  //Load details for a single post
  $('#posts').on('click', 'a' ,function(){
    // console.log('http://localhost:3000/posts/' + $(this).data('id') + '.json');
    $.ajax({
      //http://localhost:3000/posts/2.json
      url: 'http://localhost:3000/posts/' + $(this).data('id') + '.json',
      method: "GET",
      error: function(){
        alert('Failed to load!');
      },
      success: function(post){
        var template = $('#post-details').html();
        var renderedHtml = Mustache.render(template, post);
        $('#post-details-container').html(renderedHtml);
        $('#post-details-container').hide();
        $('#posts').fadeOut(400, function(){
          $('#post-details-container').fadeIn(400);
        });
      }
    });
  });

  $('#post-details-container').on('click','#back', function(){
    $('#post-details-container').fadeOut(400, function(){
      $('#posts').fadeIn(400);
    });
  });

  $('#post-details-container').on('click', '#post-comments', function(){
    var postId = $(this).data('p-id');
    console.log('http://localhost:3000/posts/' + postId + '/comments.json');
    $.ajax({
      url: 'http://localhost:3000/posts/' + postId + '/comments.json',
      method: "GET",
      error: function(){
        alert('Failed to load comments');
      },
      success: function(comments){
        var template = $("#comments").html();
        for(var i = 0; i < comments.length; ++i) {
          var renderedHtml = Mustache.render(template, comments[i]);
          $('#comments-container').append(renderedHtml);
        }
        $('#post-comments').slideUp();
      }
    })
  });

});
