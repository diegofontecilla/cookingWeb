$(document).ready(function(){

  $('#choose-ingredient').submit(function(e){
    e.preventDefault();
    var ingredient = $('#your-ingredient').val();
    displayRecipe(ingredient);
  })

  function displayRecipe(ingredient) {
    let url = 'https://www.food2fork.com/api/search'
    let params = 'key=611435ce5a67fe17c25d250242fe3c6d&q=' + ingredient
    $.get(url, params, function(res) {
      let recipesList = jQuery.parseJSON(res)
      let randomRecipe = Math.floor(Math.random() * 29);
      let yourRecipe = recipesList.recipes[randomRecipe]
      console.log(yourRecipe)
      console.log(yourRecipe.title)
      console.log(yourRecipe.source_url)
      $("#link[href='']").attr('href', yourRecipe.source_url);
      $('#your-recipe').text(yourRecipe.title)
    })
  }
})
