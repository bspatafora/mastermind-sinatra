$(document).ready(function() {

  $.getJSON('/new_board', function(data) {
    setBoardHTML(data);
    board = data;
  });


  $('#code_form').submit(function(event) {
    event.preventDefault();
    var input = $('#code').val();
    board.code = formatCode(input);
    $.post('/send', JSON.stringify(board), function(data) {
      board = data;
      $('#board tr').remove();
      setCodeHTML(data);
      setRowsHTML(data);
    });
  });


  row_index = 0


  $('#feedback_form').submit(function(event) {
    event.preventDefault();
    var input = $('#feedback').val();
    board.rows[row_index].key_peg_holes = formatCode(input);
    $.post('/send', JSON.stringify(board), function(data) {
      board = data;
      row_index += 1;
      $('#board tr').remove();
      setCodeHTML(data);
      setRowsHTML(data);
    });
  });


  function setBoardHTML(data) {
    setCodeHTML(data);
    setRowsHTML(data);
  }


  function setCodeHTML(data) {
    if (!data.code) {
      $('#board').append('<tr><th>_ _ _ _</th></tr>');
    } else {
      $('#board').append('<tr><th>' + data.code.join(' ') + '</th></tr>');
    }
  }


  function setRowsHTML(data) {
    $.each(data.rows, function(index, row) {
      if (!row.code_peg_holes[0]) {
        $('#board').append('<tr><td>_ _ _ _</td><td>' + row.key_peg_holes.join(' ') + '</td></tr>');
      } else {
        $('#board').append('<tr><td>' + row.code_peg_holes.join(' ') + '</td><td>' + row.key_peg_holes.join(' ') + '</td></tr>');
      }
    });
  }


  function formatCode(input) {
    var input_array = input.split('');
    var integer_array = input_array.map(function(digit) {
      return parseInt(digit, 10);
    });
    return integer_array;
  }

});
