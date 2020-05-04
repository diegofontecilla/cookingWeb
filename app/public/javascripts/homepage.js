$(document).ready(function(){

  $('#choose-ingredient').submit(function(e){
    e.preventDefault();
    var ingredient = $('#your-ingredient').val();
    displayRecipes(ingredient);
  })

  function displayRecipes(ingredient) {

      let url = 'https://www.food2fork.com/api/search'
      let params = 'key=611435ce5a67fe17c25d250242fe3c6d&q=' + ingredient


    $.get(url, params, function(res) {
      let recipesList = jQuery.parseJSON(res)
      let yourRecipeOne = recipesList.recipes[randomRecipe()]
      let yourRecipeTwo = recipesList.recipes[randomRecipe()]
      let yourRecipeThree = recipesList.recipes[randomRecipe()]

      $("#link-1[href='']").attr('href', yourRecipeOne.source_url);
      $('#your-recipe-1').text(yourRecipeOne.title)
      $("#link-2[href='']").attr('href', yourRecipeTwo.source_url);
      $('#your-recipe-2').text(yourRecipeTwo.title)
      $("#link-3[href='']").attr('href', yourRecipeThree.source_url);
      $('#your-recipe-3').text(yourRecipeThree.title)
    })
  }

  function randomRecipe() {
      return Math.floor(Math.random() * 29);
  }
})
