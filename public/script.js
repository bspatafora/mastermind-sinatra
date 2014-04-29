$(document).ready(function() {

  $.getJSON('/api', function(data) {

    if (data.code.length === 0) {
      $('table').append('<tr><th>_ _ _ _</th></tr>');
    } else {
      $('table').append('<tr><th>' + data.code.join(' ') + '</th></tr>');
    }

    $.each(data.rows, function(index, row) {
      if (row.code_peg_holes.length === 0) {
        $('table').append('<tr><td>_ _ _ _</td><td>' + row.key_peg_holes + '</td></tr>');
      } else {
        $('table').append('<tr><td>' + row.code_peg_holes.join(' ') + '</td><td>' + row.key_peg_holes.join(' ') + '</td></tr>');
      }
    });

  });

});
