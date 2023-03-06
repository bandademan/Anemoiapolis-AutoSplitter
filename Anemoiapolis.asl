state("AnemoiapolisChapter1") {}

startup {
	Assembly.Load(File.ReadAllBytes("Components/asl-help")).CreateInstance("Unity");
	vars.Helper.LoadSceneManager = true;
}

init {
	vars.Helper.TryLoad = (Func<dynamic, bool>)(mono => {
		vars.Helper["state"] = mono.Make<int>("SystemManager", "state");
		
		return true;
	});
}

update {
	
	current.Scene = vars.Helper.Scenes.Active.Index;
	
	if (old.Scene != current.Scene)
	{
		vars.Log("Scene changed: " + old.Scene + " -> " + current.Scene);
	}
}

start {
	return ((current.state == 1 && current.Scene == 1 && old.Scene == 0) || current.Scene == 16);
}

split {
	if (current.state == 1 && old.state == 4 && current.Scene != 1) {
		return true;
	}
}


isLoading {
	if (current.state == 4 || current.state == 0) {
		return true;
	} else {
		return false;
	}
}