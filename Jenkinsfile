node {

	def application = "springbootapp"

	def dockerhubaccountid = "rajatjain1706"

	stage('Clone repository') {

		checkout scm

	}



	stage('Build image') {

		app = docker.build("${dockerhubaccountid}/${application}:${BUILD_NUMBER}")

	}



	stage('Push image') {

		withDockerRegistry([ credentialsId: "dockerHub", url: "" ]) {

		app.push()

		app.push("latest")

	}

	}



	stage('Deploy') {

		sh ("docker run ${dockerhubaccountid}/${application}:${BUILD_NUMBER}")

	}

	

	stage('Remove old images') {

		// remove docker pld images

		sh("docker rmi ${dockerhubaccountid}/${application}:latest -f")

   }

}
