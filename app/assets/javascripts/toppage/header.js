var hover_blue = 'rgb(0, 149, 238)'
var hover_black = 'rgb(0, 0, 0)'
var white_grey = 'rgb(204, 204, 204)'
var black_grey = '#333'

//トップページの場合、ロゴマークのリンクを無効化
$(function(){
  var path = location.pathname
  if (!path.match(/^\w*\/\w{1,}/)){
    $('.upper__logo').on('click', function(e) {
      e.preventDefault();
    
    })
  }
});

//カテゴリー検索
$(function(){
   //大分類を表示・非表示
  $('.lower__left__category').hover(function() {

    $('.lower__left__category_search').css('color', hover_blue); 
    $(".lower__left__category__box").show(); 

    $(document).ready(function(){

      //中分類を表示・非表示
      $('.category__list1__item').hover(function(){

        $(this).addClass('category__list1_active');
        $('.category__list1_active').children('.category__list2').show();

      },function(){

        $(this).removeClass('category__list1_active');
        $(this).children('.category__list2').hide();

      });

      //小分類を表示・非表示
      $('.category__list2__item').hover(function(){

        $(this).addClass('category__list2_active');
        $('.category__list2_active').children('.category__list3').show();

      },function(){
  
        $(this).removeClass('category__list2_active');
        $(this).children('.category__list3').hide();
    
      });
    });
  }, function() {

    $(".lower__left__category__box").hide(); 
    $('.lower__left__category_search').css('color', hover_black); 

  });
});

//ブランド検索
$(function(){

  //ブランドを表示・非表示
  $('.lower__left__brand').hover(function() {

    $('.lower__left__brand_search').css('color', hover_blue); 
    $(".lower__left__brand__box").show(); 

  }, function() {

    $(".lower__left__brand__box").hide(); 
    $('.lower__left__brand_search').css('color', hover_black); 

  });
});

//ホバー時にfontawsomeと文言の色を変更
$(function(){

  $('.lower__right_li').hover(function() {

    $(this).find('.fa').css('color',  hover_blue); 
    $(this).css('color', hover_blue); 

  }, function() {
    
    $(this).find('.fa').css('color',  white_grey); 
    $(this).css('color',  black_grey); 
    
  });
});