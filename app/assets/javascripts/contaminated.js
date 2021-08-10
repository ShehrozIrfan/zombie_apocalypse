$(document).on('click', '#btn_contaminated', function(e) {
    var current_id = $(this).attr('current_id');
    console.log(current_id);
    var elm = $(e.target);
    $.ajax({
        type: "GET",
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
        url: "/survivals/mark_infected",
        data: { id: current_id },
        success:function(data) {
            if(data){
                alert("Successfully Marked Infected!")
                location.reload();
            }
        }
      })
})
