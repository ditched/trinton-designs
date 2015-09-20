<?php $page = 'contact'; include('layout/header.php'); ?>
  <div class="container contact">
    <h1>ARE YOU A SMALL BUSINESS?</h1>
    <h1>DO YOU HAVE AN IDEA?</h1>
    <div class="spacer"></div>
    <h1>HIT US UP, WE'LL MAKE IT HAPPEN.</h1>
    <div class="spacer"></div>
    <form id="contact-form">
      <input type="text" id="name" placeholder="First name">
      <div class="form-group">
        <input type="text" id="email" placeholder="Email Address">
        <input type="text" id="budget" placeholder="Budget">
      </div>
      <textarea id="message" cols="30" rows="10" placeholder="How can we help you?"></textarea>
      <input type="hidden" id="csrf-token" name="<?php echo $csrf_key; ?>" value="<?php echo $csrf_token; ?>">
      <input type="submit" value="SEND">
    </form>
  </div>
<?php include('layout/footer.php'); ?>