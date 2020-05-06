window.addEventListener('load', function() {
  /* タブの切替 （おしらせ、やることリスト）*/
  $('.mypage-tab').on('click', function () {
    $('.mypage-tab').removeClass('active');
    $(this).addClass('active');
  });

  /* タブの切替 （取引中、過去の取引）*/
  $('.btm').on('click', function () {
    $('.btm').removeClass('action');
    $(this).addClass('action');
  });
  
});