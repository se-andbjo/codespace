// Import the Secret Manager client library
const {SecretManagerServiceClient} = require('@google-cloud/secret-manager');

// Instantiate a client
const client = new SecretManagerServiceClient();

// The name of the secret to access
const secretName = 'projects/1042712680271/secrets/MY_ROXTEC_CMS_API_KEY/versions/latest';

// Access the secret version
async function accessSecretVersion() {
  try {
    const [version] = await client.accessSecretVersion({
      name: secretName,
    });

    // Extract the secret payload as a string
    const payload = version.payload.data.toString('utf8');
    
    console.log(`Secret: ${payload}`);
  } catch (err) {
    console.error('Error accessing secret version:', err);
  }
}

accessSecretVersion();