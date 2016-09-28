$("#articles-list").html("<%= escape_javascript(render @articles) %>")
$("#articles-pagination").html("<%= escape_javascript(will_paginate @articles) %>")
