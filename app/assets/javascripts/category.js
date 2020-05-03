document.addEventListener("turbolinks:load", function() {
  $(function(){
    function appendOption(category){
      var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
      return html;
    }

    function appendChidrenBox(insertHTML){
      var childSelectHtml = '';
      childSelectHtml = `<div class='select' id= 'select'>
                          <select class="select-category" id="child_category" name="item[category_id]">
                            <option value="---" data-category="選択してください">選択してください</option>
                            ${insertHTML}
                          <select>
                        </div>`;
      $('.style').append(childSelectHtml);
    }

    function appendGrandchidrenBox(insertHTML){
      var grandchildSelectHtml = '';
      grandchildSelectHtml =  `<div class='select' id= 'select'>
                          <select class="select-category" id="grandchild_category" name="item[category_id]">
                            <option value="---" data-category="---">選択してください</option>
                            ${insertHTML}
                          <select>
                        </div>`;
      $('.style').append(grandchildSelectHtml);
    }

    $("#parent-form").on("change",function(){
      var parentId = document.getElementById("parent-form").value;
      if (parentId != ""){ 
        $.ajax({
          url: 'get_category_children',
          type: "GET",
          data: {parent_id: parentId },
          dataType: 'json'
        })
        .done(function(children){
          $('#child_category').remove(); //親が変更された時、子以下を削除するする
          $('#grandchild_category').remove();
          var insertHTML = '';
          children.forEach(function(child){
            insertHTML += appendOption(child);
          });
          appendChidrenBox(insertHTML);
        })
        .fail(function(){
          alert('カテゴリー取得に失敗しました');
        })
      }else{
        $('#child_category').remove(); //親カテゴリーが初期値になった時、子以下を削除するする
        $('#grandchild_category').remove();

      }
    })

    $('.style').on('change', '#child_category', function(){
      var childId = $('#child_category option:selected').data('category'); 
      if (childId != "選択してください"){ 
        $.ajax({
          url: 'get_category_grandchildren',
          type: 'GET',
          data: { child_id: childId },
          dataType: 'json'
        })
        .done(function(grandchildren){
          $('#grandchild_category').remove();
          var insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendGrandchidrenBox(insertHTML);
        })
        .fail(function(){
          alert('カテゴリー取得に失敗しました');
        })
      }else{
        $('#grandchild_category').remove(); //子カテゴリーが初期値になった時、孫以下を削除する
      }
    })
  })
})