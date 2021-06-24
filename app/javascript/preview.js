document.addEventListener('DOMContentLoaded', function(){
  if ( document.getElementById('item_image')){
    const ImageList = document.getElementById('image-list');

    const createImageHTML = (blob) => {
       // 画像を表示するためのdiv要素を生成
      const imageElement = document.createElement('div');
      imageElement.setAttribute('class', "image-element")
      let imageElementNum = document.querySelectorAll('.image-element').length

      // 表示する画像を生成
      const blobImage = document.createElement('img');
      blobImage.setAttribute('id', `view_image_${imageElementNum}`)
      blobImage.setAttribute('class', `test`)
      blobImage.setAttribute('src', blob);

      // ファイル選択ボタンを生成
      const inputHTML = document.createElement('input')
      //const inputHTML = document.createElement('div');
      inputHTML.setAttribute('class', "image-view")
      inputHTML.setAttribute('id', `message_image_${imageElementNum}`)
      inputHTML.setAttribute('name', 'message[images][]')
      inputHTML.setAttribute('type', 'file')


      // 生成したHTMLの要素をブラウザに表示させる
      imageElement.appendChild(blobImage);
      imageElement.appendChild(inputHTML)
      ImageList.appendChild(imageElement);

      inputHTML.addEventListener('change', (e) => {
        file = e.target.files[0];
        blob = window.URL.createObjectURL(file);

        createImageHTML(blob)
      })
    }

    document.getElementById('item_image').addEventListener('change', function(e){
      // 画像が表示されている場合のみ、すでに存在している画像を削除する
      const imageContent = document.querySelector('img');
      if (imageContent){
        imageContent.remove();
      }

      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      createImageHTML(blob);
    });
  }
});