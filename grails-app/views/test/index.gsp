<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Test App</title>

    <script type="text/javascript">
        contextPath = "${request.contextPath}";
    </script>
    <asset:stylesheet src="bootstrap.css"/>
    <asset:javascript src="jquery-3.5.1.js"/>
</head>

<body>
<div style="text-align: center" class="container">
    <h3>Messages</h3>
    <hr>
    <g:if test="${messages.size() == 0}">
        <h3>No messages still, pls create one below</h3>
    </g:if>
    <ul>
        <g:each in="${messages}" var="mesg">
            <li class="text-danger">${mesg.message}</li>
        </g:each>
    </ul>
</div>

<div style="text-align: center" class="text-success p-5">
    <label>
        <input type="text" id="new-msg" class="form-control" placeholder="Add new Message"/>
    </label>
</div>

<div style="text-align: center;" class="text-center p-5">
    <button type="button" id="save-new-msg-btn" class="btn btn-outline-success">Save</button>
    <button id="create-new-error-btn" style="margin-left: 8rem" type="button"
            class="btn btn-outline-danger">Create Error to make log</button>
</div>
</body>
<script>
    $(document).ready()
    {
        $("#save-new-msg-btn").click(function () {
            let input = $("#new-msg").val();
            if (input === "" || input === 'undefined') {
                alert("invalid Input !!");
                return false;
            }

            $.post(contextPath + "/test/saveMessage/", {'input': input}, function (json) {
                if (json.success) {
                    window.location.reload();
                } else {
                    console.error('Error occured while saving !!');
                }
            })

        });

        $("#create-new-error-btn").click(function () {
            $.get(contextPath + "/test/createError/");
            console.log('Error created in logs ! please check...')
        });
    }
</script>
</html>