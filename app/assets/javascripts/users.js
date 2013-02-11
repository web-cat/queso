
$(document).on("click", "#userDeleteButton", function () {
  var deleteUserId = $(this).data('delete-user-id');
  var deleteUserName = $(this).data('delete-user-name');
  $(".modal-body #user-to-delete").text(deleteUserName);
  $(".modal-footer form").attr("action", "/users/" + deleteUserId);
  $('#deleteUserModal').modal('show');
});