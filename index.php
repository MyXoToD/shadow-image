<?php
require_once('includes/header.inc.php');
?>

<header class="header-wrapper">
  <div class="header-content">
    <h1 class="entypo-code"> Shadow Image</h1>
    <p>This tool will convert your images into a single <a href="http://www.w3schools.com/cssref/css3_pr_box-shadow.asp">CSS box-shadow</a> value. I <u>do not</u> recommend using this technique for production. This is only a tech-demo and should be used with caution.</p>
    <p>Scroll down and see how it works.</p>
  </div>
  <div class="btn-more entypo-down-open-big"></div>
</header>

<div class="wrapper dark">
  <div class="content">
    <h1>Convert image to box-shadow</h1>
    <p>Select an image and wait a couple of seconds. This may take a while to process. It is not recommended to use images larger than 100px.</p>

    <div class="upload">
      <input type="file" class="file-upload" id="file-upload" />
      <label for="file-upload">Select image</label>
    </div>

    <canvas class="image-preview"></canvas>

    <textarea class="code">box-shadow:</textarea>
    
    <p class="preview">
      <strong>Box-Shadow Preview</strong>
    </p>

    <div class="preview-shadow"></div>

    <!-- <div class="avg-color">
      <strong>Average Color</strong>

      <span></span>
    </div> -->
  </div>
</div>

<div class="wrapper">
  <div class="content">
    <h1>How it works</h1>
    <p>Each pixel of your image will be checked for its color and position. That's basically it. With these information the tool can convert everything to box-shadow. The box-shadow element must be 1 pixel in width and height. The top-left pixel of your image will be the background color of this element and all the other pixels will be added as the box-shadow.</p>
    <p><s>Yes! I do suck at descriptions.</s></p>
  </div>
</div>

<div class="wrapper dark">
  <div class="content">
    <h1>Made with <span style="color:red">&hearts;</span></h1>

    <p style="text-align: center;">
      <img src="assets/images/avatar.jpg" alt="" class="avatar" />
    </p>

    <p>Shadow image is a project by <a href="http://myxotod.com">Max Boll</a> aka <a href="http://twitter.com/myxotod">@MyXoToD</a>. Proud member of <a href="http://bullg.it">bullgit</a>.</p>
  
    <p>Check out the code on <a href="http://github.com/myxotod/shadow-image">github</a>.</p>
  </div>
</div>

<?php
require_once('includes/footer.inc.php');
?>