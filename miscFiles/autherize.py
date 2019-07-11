def authorization(auth,role,user_role):
    if auth:
        if role == user_role:
            return True
        else:
            return False, "wrongUser"
    else:
        return False, "notLogin"